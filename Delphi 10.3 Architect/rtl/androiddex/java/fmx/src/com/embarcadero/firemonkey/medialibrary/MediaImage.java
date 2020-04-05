/**
 * {*******************************************************}
 * {                                                       }
 * {        Delphi FireMonkey Media Library Service        }
 * {                                                       }
 * {   Implementation Media Library Service for Android    }
 * {                                                       }
 * { Copyright(c) 2013-2014 Embarcadero Technologies, Inc. }
 * {                                                       }
 * {*******************************************************}
 */
package com.embarcadero.firemonkey.medialibrary;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Build;
import android.provider.MediaStore;
import android.util.Log;

import android.support.v4.content.FileProvider;

public class MediaImage {

    private static final String TAG = "MediaImage";
    private static final String JPEG_FILE_PREFIX = "IMG_";
    private static final String JPEG_FILE_SUFFIX = ".jpg";
    private static final String ADD_PHOTO_TO_LIBRARY = "android.intent.action.MEDIA_SCANNER_SCAN_FILE";

    private Activity mActivity;
    private File mImageFile = null;
    private Bitmap mBitmap = null;
    private boolean mFileChanged;

    /**
     * <ul>
     * <li>CAMERA_PHOTO - Store image bitmap in Photo Album</li>
     * <li>CACHE - Store image bitmap in temporary cache directory</li>
     * </ul>
     */
    public enum ImageStorePlace {
        CAMERA_PHOTO, CACHE
    };

    /**
     * Load bitmap from web (download image or open from picassa album) with required size.
     * If bitmap size is bigger a required size, then bitmap will stretch to required size
     * with storing proportion.
     *
     * @param imageUri uri on image file
     * @param requiredSize required width and height of result bitmap
     */
    public static MediaImage loadFromUri(Activity activity, Uri imageUri, Size requiredSize) {
        MediaImage mediaImage = new MediaImage(activity, ImageStorePlace.CACHE);

        String fileName = mediaImage.getFileNameFromURI(imageUri);
        if (!isContentImage(fileName) && !isHttpImage(fileName))
            mediaImage.loadFromFile(fileName, requiredSize);
        else
            mediaImage.loadFromWeb(imageUri, requiredSize);
        mediaImage.saveToTempFile();
        return mediaImage;
    }

    public MediaImage(Activity activity)
    {
        mActivity = activity;
        mFileChanged = false;
    }

    public MediaImage(Activity activity, ImageStorePlace imageType) {
        mActivity = activity;
        mFileChanged = false;
        if (imageType == ImageStorePlace.CAMERA_PHOTO) {
            mImageFile = createPhotoFile();
        } else {
            mImageFile = createTempFile();
        }
    }

    public void remove() {
        if (isFileExists()) {
            mImageFile.delete();
        }
    }

    /**
     * Return absolute fine name for encapsulated image.
     * @return absolute file name
     */
    public String getFileName() {
        return mImageFile.getAbsolutePath();
    }

    public Uri getFileUri() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            String authority = mActivity.getPackageName() + ".fileprovider";
            return FileProvider.getUriForFile(mActivity, authority, mImageFile);
        }
        return Uri.fromFile(mImageFile);
    }

    public boolean isFileExists() {
        return (mImageFile != null) && (mImageFile.exists());
    }

    public boolean isImageLoaded() {
        return mBitmap != null;
    }

    /**
     * Return rotation angle, based on orientation camera, when image was taken.
     *
     * @return Degrees
     */
    public int getRotationAngle() {
        ExifInterface exif;
        int rotationInDegrees = 0;
        try {
            exif = new ExifInterface(getFileName());
            int orientation = exif.getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL);
            rotationInDegrees = exifToDegrees(orientation);
        } catch (IOException e) {
            Log.e(TAG, e.getMessage(), e);
            e.printStackTrace();
        }
        return rotationInDegrees;
    }

    /**
     * Rotate the image for correct viewing of the photo (Based on EXIF
     * information about orientation of photo)
     */
    public void normalizeOrientation() {
        int angle = getRotationAngle();
        if (angle != 0) {
            Matrix matrix = new Matrix();
            matrix.preRotate(angle);
            Bitmap rotatedBitmap = Bitmap.createBitmap(mBitmap, 0, 0, mBitmap.getWidth(), mBitmap.getHeight(), matrix,
                    true);
            // We should release old bitmap memory.
            unloadBitmap();
            mBitmap = rotatedBitmap;
            mFileChanged = true;
        }
    }

    public void addPhotoToGallery() {
        if (mActivity != null) {
            Intent intent = new Intent(ADD_PHOTO_TO_LIBRARY);
            intent.setData(getFileUri());

            mActivity.sendBroadcast(intent);
        }
    }

    /**
     * Save picture to file only if bitmap of picture was changed
     */
    public void saveToFile() {
        if (mFileChanged) {
            try {
                FileOutputStream out = new FileOutputStream(getFileName());
                mBitmap.compress(Bitmap.CompressFormat.JPEG, 100, out);
                out.close();
                mFileChanged = false;
            } catch (Exception e) {
                Log.e(TAG, e.getMessage(), e);
                e.printStackTrace();
            }
        }
    }

    /**
     * Save picture to new temporary file
     */
    public void saveToTempFile() {
        mImageFile = createTempFile();
        mFileChanged = true;
        saveToFile();
    }

    /**
     * Load bitmap from file with required size. If bitmap size is bigger a required size,
     * then bitmap will stretch to required size with storing proportion.
     *
     * @param requiredSize required width and height of result bitmap
     */
    public void loadFromFile(Size requiredSize) {
        loadFromFile(getFileName(), requiredSize);
    }

    public void loadFromFile(String fileName, Size requiredSize) {
        File fileTmp = new File(fileName);
        unloadBitmap();
        if (fileTmp.exists()) {

            mImageFile = fileTmp;
            // Determine size of loaded image
            // First decode with inJustDecodeBounds=true to check dimensions
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(fileName, options);

            // Calculate inSampleSize
            options.inSampleSize = calculateInSampleSize(options.outWidth, options.outHeight, requiredSize);
            options.inJustDecodeBounds = false;
            options.inPurgeable = true;

            // Decode bitmap with inSampleSize set
            mBitmap = BitmapFactory.decodeFile(fileName, options);
            if (options.inSampleSize > 1)
                mFileChanged = true;
        } else
        {
            mBitmap = null;
            mFileChanged = false;
        }
    }

    private void loadFromWeb(Uri fileUri, Size requiredSize) {
        try {
            InputStream is;
            String fileName = getFileNameFromURI(fileUri);

            if (isContentImage(fileName))
                is = mActivity.getContentResolver().openInputStream(Uri.parse(fileName));
            else
                is = new URL(fileName).openStream();

            OutputStream os = new FileOutputStream(mImageFile);
            try {
                Utils.copyStream(is, os);
            } finally {
                os.close();
            }
            loadFromFile(mImageFile.getAbsolutePath(), requiredSize);
        } catch (Exception e) {
            Log.e(TAG, e.getMessage(), e);
            e.printStackTrace();
        }
    }

    /**
     * Release native bitmap instance for release memory
     */
    public void unloadBitmap() {
        if (mBitmap != null)
            mBitmap.recycle();
        mBitmap = null;
    }

    /* Private helpers */

    /**
     * Create temporary file in application cache directory.
     */
    private File createTempFile() {
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
        String imageFileName = JPEG_FILE_PREFIX + timeStamp;
        File fileTemp;
        try {
            fileTemp = File.createTempFile(imageFileName, JPEG_FILE_SUFFIX);
            fileTemp.deleteOnExit();
        } catch (IOException e) {
            fileTemp = null;
            Log.e(TAG, e.getMessage(), e);
            e.printStackTrace();
        }
        return fileTemp;
    }

    /**
     * Create empty size into device photo album.
     */
    private File createPhotoFile() {
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
        String imageFileName = JPEG_FILE_PREFIX + timeStamp + JPEG_FILE_SUFFIX;
        File photosDir = Utils.getPhotosDir();
        return new File(photosDir, imageFileName);
    }

    private int calculateInSampleSize(final int width, final int height, final Size reqSize) {
        // Attention! Note: A power of two value is calculated because the decoder uses
        // a final value by rounding down to the nearest power of two, as per the inSampleSize documentation.

        int inSampleSize = 1;

        if (height > reqSize.getHeight() || width > reqSize.getWidth()) {
            // Calculate the largest inSampleSize value that is a power of 2 and keeps both
            // height and width larger than the requested height and width.
            while ((height / inSampleSize) > reqSize.getHeight() || (width / inSampleSize) > reqSize.getWidth()) {
                inSampleSize *= 2;
            }
        }
        return inSampleSize;
    }

    /**
     * Returns absolute file name for URI, which refers to image in Media Library or in Picasa Album.
     */
    private String getFileNameFromURI(Uri fileUri) {
        // some devices (OS versions return an URI of com.android instead of com.google.android
        if ((fileUri != null) && fileUri.toString().startsWith("content://com.android.gallery3d.provider")) {
            // use the com.google provider, not the com.android provider.
            fileUri = Uri.parse(fileUri.toString().replace("com.android.gallery3d", "com.google.android.gallery3d"));
        }

        String filePath = null;
        String[] projection = { MediaStore.Images.Media.DATA };
        Cursor cursor = mActivity.getContentResolver().query(fileUri, projection, null, null, null);
        if (cursor != null) {
            try {
                if (cursor.moveToFirst()) {
                    int column_index_data = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
                    if ((column_index_data != -1)) {
                        filePath = cursor.getString(column_index_data);
                    }
                }
            } finally {
                cursor.close();
            }
        }
        if (filePath == null) {
            filePath = fileUri.toString();
        }
        return filePath;
    }

    /**
     * Convert orientation from EXIF of bitmap file to angle in degrees.
     *
     * @param exifOrientation is orientation from EXIF information of bitmap file
     */
    private static int exifToDegrees(int exifOrientation) {
        switch(exifOrientation) {
            case ExifInterface.ORIENTATION_ROTATE_90:
                return 90;
            case ExifInterface.ORIENTATION_ROTATE_180:
                return 180;
            case ExifInterface.ORIENTATION_ROTATE_270:
                return 270;
            default:
                return 0;
        }
    }

    private static boolean isContentImage(String str) {
        return str != null && str.startsWith("content://");
    }

    private static boolean isHttpImage(String str) {
        return str != null && (str.startsWith("http://") || str.startsWith("https://"));
    }

    public boolean cropImage(Uri selectedUri) {
        Intent intent = new Intent("com.android.camera.action.CROP");
        File tempFile = createPhotoFile();
        if (selectedUri == null) {
            selectedUri = getFileUri();
        }
        intent.setDataAndType(selectedUri, "image/*");
        intent.putExtra("return_data", false);
        intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(tempFile));
        if (intent.resolveActivity(mActivity.getPackageManager()) == null) {
            return false;
        }
        mImageFile = tempFile;
        mActivity.startActivityForResult(intent, FMXMediaLibrary.ACTION_CROP_IMAGE);
        return true;
    }
}
