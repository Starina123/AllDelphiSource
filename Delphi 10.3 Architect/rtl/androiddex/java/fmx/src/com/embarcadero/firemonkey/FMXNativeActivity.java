package com.embarcadero.firemonkey;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.app.NativeActivity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.PixelFormat;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Bundle;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.WindowManager;
import android.support.v4.app.JobIntentService;
import android.support.v4.view.WindowInsetsCompat;
import android.support.v4.view.OnApplyWindowInsetsListener;

import com.embarcadero.firemonkey.debugger.DebuggerUtils;
import com.embarcadero.firemonkey.device.DeviceArchitectureChecker;
import com.embarcadero.firemonkey.fullscreen.FullScreenManager;
import com.embarcadero.firemonkey.keyboard.VirtualKeyboard;
import com.embarcadero.firemonkey.medialibrary.FMXMediaLibrary;
import com.embarcadero.firemonkey.medialibrary.FMXMediaLibraryListener;
import com.embarcadero.firemonkey.text.FMXEditText;
import com.embarcadero.firemonkey.keyboard.OnKeyboardStateChangedListener;
import com.embarcadero.rtl.notifications.NotificationInfo;
import com.embarcadero.rtl.notifications.NotificationPublisher;

import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FMXNativeActivity extends NativeActivity implements FMXMediaLibraryListener {

    private static final String TAG = "FMXNativeActivity";

    private KeyEvent mLastEvent;
    private OnActivityListener mListener;
    private FMXMediaLibrary mMediaLibrary;
    private FMXEditText mEditText;
    private Bundle mStartupGCM;
    private boolean mPaused = false;

    private Dialog mPickerDialog;
    private int mPickerDialogId = 1;

    private ViewGroup mViewGroup;
    private ViewStack mViewStack;

    // For notifications and intent filters
    private final List<String> registeredIntentActions = new ArrayList<String>(Arrays.asList(
                                                                               NotificationInfo.ACTION_NOTIFICATION,
                                                                               NotificationPublisher.ACTION_GCM_NOTIFICATION));

    @NonNull
    private FullScreenManager fullScreenManager = new FullScreenManager(this);

    private VirtualKeyboard virtualKeyboard;

    private final Rect windowInsets = new Rect();

    @Nullable
    private OnActivityInsetsChangedListener onActivityInsetsChangedListener;

    private boolean isWindowInsetsDefined = false;

    // The following line is replaced by outside of Java world.
    // To keep security, Release version classes.DEX doesn't contain any
    // debugger
    // support code. see $(TP)\scripts\hudson\android_dex\compile_dex.bat
    //
    // Clever Java compiler will remove some code blocks from binary.
    // For eclipse user, your classes.dex is ALWAYS debug version.
    //
    private static final boolean CLASSES_DEX_DEBUGGER_SUPPORT = true; // TAG:REPLACE

    @SuppressLint("NewApi")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // Check device architecture
        DeviceArchitectureChecker.check();

        // Debugger
        if (CLASSES_DEX_DEBUGGER_SUPPORT) {
            DebuggerUtils debuggerUtils = new DebuggerUtils(this);
            debuggerUtils.tryStartDebugger();
        }

        virtualKeyboard = new VirtualKeyboard(this);

        super.onCreate(savedInstanceState);

        getWindow().takeSurface(null);
        getWindow().setFormat(PixelFormat.UNKNOWN);
        if (android.os.Build.VERSION.SDK_INT >= 22) {
            getWindow().setClipToOutline(false);
        }
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING);

        Intent aIntent = getIntent();
        Bundle aExtra = aIntent.getExtras();
        if (aExtra != null) {
            // Get properties if this activity was started by clicking Firebase notification
            mStartupGCM = aExtra;
        }

        mEditText = new FMXEditText(this);
        mEditText.setVisibility(View.GONE);

        mViewGroup = (ViewGroup) findViewById(android.R.id.content);
        mViewGroup.addView(mEditText);
        mViewGroup.setTag("mViewGroup");
        ViewCompat.setOnApplyWindowInsetsListener(getWindow().getDecorView(), new OnApplyWindowInsetsListener() {
            @Override
            public WindowInsetsCompat onApplyWindowInsets(View v, WindowInsetsCompat insets) {
                isWindowInsetsDefined = true;
                windowInsets.top = insets.getSystemWindowInsetTop();
                windowInsets.bottom = insets.getSystemWindowInsetBottom();
                windowInsets.left = insets.getSystemWindowInsetLeft();
                windowInsets.right = insets.getSystemWindowInsetRight();

                if (onActivityInsetsChangedListener != null) {
                    onActivityInsetsChangedListener.insetsChanged(windowInsets);
                }

                // Since setting a listener disables the method onApplyWindowInsets, but decorView has special logic for theme
                // supporting, we redirect this invoke to decorView.
                return ViewCompat.onApplyWindowInsets(v, insets);
            }
        });

        mMediaLibrary = new FMXMediaLibrary(this);
        mMediaLibrary.setListener(this);

        mViewStack = new ViewStack(this);

        virtualKeyboard.addOnKeyboardStateChangedListener(new OnKeyboardStateChangedListener() {
            @Override
            public void onVirtualKeyboardWillShown() {
            }

            @Override
            public void onVirtualKeyboardFrameChanged(@NonNull Rect newFrame) {
            }

            @Override
            public void onVirtualKeyboardWillHidden() {
                FMXNativeActivity.this.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        fullScreenManager.callback();
                    }
                });
            }
        });
    }

    public VirtualKeyboard getVirtualKeyboard() {
        return virtualKeyboard;
    }

    public ViewStack getViewStack() {
        return mViewStack;
    }

    /**
     * Returns activity window insets. This value can be used for retrieving system status bar height and soft keyboard height.
     */
    @NonNull
    public Rect getWindowInsets() {
        return this.windowInsets;
    }

    /**
     * Specifies whether activity's window defined insets or not.
     */
    public boolean isWindowInsetsDefined() {
        return this.isWindowInsetsDefined;
    }

    public void setOnActivityInsetsChangedListener(@Nullable OnActivityInsetsChangedListener onActivityInsetsChangedListener) {
        this.onActivityInsetsChangedListener = onActivityInsetsChangedListener;
    }

    @Nullable
    public OnActivityInsetsChangedListener getOnActivityInsetsChangedListener() {
        return onActivityInsetsChangedListener;
    }

    @Override
    public void onResume() {
        super.onResume();
        mPaused = false;

        fullScreenManager.initFullScreenFSM();
        getWindow().getDecorView().post(new Runnable() {
            @Override
            public void run() {
                fullScreenManager.callback();
            }
        });
    }

    @Override
    public void onPause() {
        super.onPause();
        mPaused = true;
        fullScreenManager.unInitFullScreenFSM();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        virtualKeyboard.getVirtualKeyboardFrameObserver().stopObservation();
    }

    public ViewGroup getViewGroup() {
        return mViewGroup;
    }

    public int addView(View view, LayoutParams params) {
        mViewGroup.addView(view, params);
        return mViewGroup.indexOfChild(view);
    }

    public void removeView(View view) {
        mViewGroup.removeView(view);
    }

    public void removeViewAt(int index) {
        mViewGroup.removeViewAt(index);
    }

    public void embSetOrientation(int orientationMask) {
        switch (orientationMask) {
            case -1:
                setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_USER);
                break;
            case 0:
                setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                break;
            case 1:
                setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
                break;
            case 2:
                setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_REVERSE_PORTRAIT);
                break;
            case 3:
                setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE);
                break;
        }
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        if (hasFocus) {
            fullScreenManager.callback();
        }
        super.onWindowFocusChanged(hasFocus);
    }

    public KeyEvent getLastEvent() {
        return mLastEvent;
    }

    public void setListener(OnActivityListener listener) {
        mListener = listener;
    }

    public Bundle getStartupGCM() {
        return mStartupGCM;
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        mLastEvent = event;
        return super.dispatchKeyEvent(event);
    }

    public FMXMediaLibrary getFMXMediaLibrary() {
        return mMediaLibrary;
    }

    @SuppressWarnings("deprecation")
    public void showDialog(int id, Dialog dialog) {
        mPickerDialog = dialog;
        showDialog(id);
    }

    @Override
    @Deprecated
    protected Dialog onCreateDialog(int id) {
        // We don't need to hold instance of dialog.
        Dialog tempDialog = mPickerDialog;
        mPickerDialog = null;
        return tempDialog;
    }

    public int getNextPickerDialogId() {
        return mPickerDialogId++;
    }

    @SuppressLint("NewApi")
    public Point getRawDisplaySize() {
        final Display display = getWindowManager().getDefaultDisplay();
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR1) {
            final DisplayMetrics metrics = new DisplayMetrics();
            display.getRealMetrics(metrics);
            return new Point(metrics.widthPixels, metrics.heightPixels);
        } else {
            try {
                Method getRawHeight = Display.class.getMethod("getRawHeight");
                Method getRawWidth = Display.class.getMethod("getRawWidth");
                return new Point((Integer) getRawWidth.invoke(display), (Integer) getRawHeight.invoke(display));
            } catch (Throwable e) {
            }
        }
        return null;
    }

    protected boolean hasListener() {
        return mListener != null;
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (hasListener()) {
            // Working with result of action of taking photo from camera or Photo Library
            if (FMXMediaLibrary.isRequestForTakingImage(requestCode)) {
                if (resultCode == RESULT_OK) {
                    mMediaLibrary.handleTakingPhotoRequest(data, requestCode);
                } else {
                    mListener.onCancelReceiveImage(requestCode);
                }
                // Otherwise call the generic ActivityResult messenger
            } else {
                Log.i(TAG, "Request code not from FMXMediaLibrary, calling generic handler.");
                mListener.onReceiveResult(requestCode, resultCode, data);
            }
        }
    }

    public void registerIntentAction(String action) {
        registeredIntentActions.add(action);
    }

    /**
     * Checks, Does intent extras contains Firebase push notification data.
     */
    private boolean isFirebaseData(@Nullable Bundle extras){
        return extras != null && extras.containsKey("google.message_id");
    }

    /**
     * Creates special intent with push notification data for internal processing in Delphi side.
     */
    @NonNull
    private Intent preparePushNotificationIntent(@NonNull Bundle extras) {
        Intent intent = new Intent(NotificationPublisher.ACTION_GCM_NOTIFICATION);
        intent.putExtra("fcm", extras);
        return intent;
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);

        if (!hasListener()) {
            return;
        }

        Intent newIntent;
        Bundle extras = intent.getExtras();
        if (isFirebaseData(extras)) {
            newIntent = preparePushNotificationIntent(extras);
        } else {
            newIntent = intent;
        }

        if (registeredIntentActions.contains(newIntent.getAction())) {
            mListener.onReceiveNotification(newIntent);
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        mMediaLibrary.onSaveInstanceState(outState);
    }

    @Override
    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        mMediaLibrary.onRestoreInstanceState(savedInstanceState);
    }

    /**
     * Returns native edit field for text inputting on FMX side.
     */
    @NonNull
    public FMXEditText getEditText() {
        return mEditText;
    }

    @Override
    public void onRequestPermissionsResult (int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (hasListener()) {
            mListener.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }

    public String getDeviceID() {
        String deviceID = Settings.Secure.getString(this.getContentResolver(), Settings.Secure.ANDROID_ID);
        try {
            MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
            digest.update(deviceID.getBytes());
            byte messageDigest[] = digest.digest();

            StringBuilder hexString = new StringBuilder(32);
            for (int i = 0; i < messageDigest.length; i++) {
                String h = Integer.toHexString(0xFF & messageDigest[i]);
                if (h.length() == 1) {
                    hexString.append("0");
                }
                hexString.append(h);
            }
            return hexString.toString().toUpperCase();
        } catch (NoSuchAlgorithmException e) {}
        return "";
    }

    @Override
    public void OnMediaLibraryCancel(int requestCode) {
        mListener.onCancelReceiveImage(requestCode);
    }

    @Override
    public void OnMediaLibraryAccept(int requestCode) {
        mListener.onReceiveImagePath(requestCode, mMediaLibrary.getLastPhotoName());
    }

    public void startJobIntentService(String serviceName, int jobId, Intent workIntent) {
        try
        {
            Class serviceClass = Class.forName(serviceName);
            Class jobIntentServiceClass = serviceClass.asSubclass(JobIntentService.class);
            Method enqueueWork = JobIntentService.class.getMethod("enqueueWork", Context.class, Class.class, int.class, Intent.class);
            if (enqueueWork != null)
                enqueueWork.invoke(null, this, jobIntentServiceClass, jobId, workIntent);
        } catch (Throwable e) {
            Log.i(TAG, "Exception occurred enqueuing service work: " + e.getClass().getCanonicalName() + " " + e.getMessage());
        }
    }

    /**
     * Returns full screen manager.
     */
    @NonNull
    public FullScreenManager getFullScreenManager() {
        return fullScreenManager;
    }
}