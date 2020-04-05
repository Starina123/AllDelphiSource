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

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import android.os.Environment;
import android.util.Log;

public class Utils {

	private static final String TAG = "FMX_UTILS";
	private static final int BUFFER_SIZE = 1024 * 8;

	public static int copyStream(InputStream input, OutputStream output) throws Exception, IOException {

		byte[] buffer = new byte[BUFFER_SIZE];

		BufferedInputStream in = new BufferedInputStream(input, BUFFER_SIZE);
		BufferedOutputStream out = new BufferedOutputStream(output, BUFFER_SIZE);
		int count = 0;
		int n = 0;
		try {
			while ((n = in.read(buffer, 0, BUFFER_SIZE)) != -1) {
				out.write(buffer, 0, n);
				count += n;
			}
			out.flush();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				Log.e(TAG, e.getMessage(), e);
			}
			try {
				in.close();
			} catch (IOException e) {
				Log.e(TAG, e.getMessage(), e);
			}
		}
		return count;
	}

	/**
	 * Function returns directory of storing album of camera photos. If system
	 * cannot get this directory or it doesn't exist, function returns null.
	 * 
	 * @return
	 */
	public static File getPhotosDir() {
		return getAlbumDir("Camera");
	}
	
	/**
	 * Function returns directory of storing album. If system cannot get this 
	 * directory or it doesn't exist, function returns null.
	 * 
	 * @return
	 */
	public static File getAlbumDir(String albumName) {
		File storageDir = null;

		if (Environment.MEDIA_MOUNTED.equals(Environment.getExternalStorageState())) {

			File pathDCIM = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);
			storageDir = new File(pathDCIM, albumName);

			if ((storageDir != null) && !storageDir.mkdirs() && !storageDir.exists()) {
				return null;
			}
		} else {
			Log.v(TAG, "External storage is not mounted READ/WRITE.");
		}

		return storageDir;
	}
}
