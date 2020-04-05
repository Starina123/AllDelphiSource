package com.embarcadero.firemonkey.fullscreen;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.WindowManager;

import java.util.Objects;

public class FullScreenManager {

    private final static int NSTATES = 4;

    public final static int STATE_STAT_NAV = 0;
    public final static int STATE_NAV = 1;
    public final static int STATE_Z1 = 2;
    public final static int STATE_Z2 = 3;

    private final static int TRANS_HIDE_STATUSBAR = 0;
    private final static int TRANS_SHOW_STATUSBAR = 1;
    private final static int TRANS_HIDE_SYSTEM_UI = 2;
    private final static int TRANS_SHOW_SYSTEM_UI = 3;

    private final static int[][] FSM =
            {
                // STATE_STAT_NAV ->
                {
                    STATE_NAV, 			    // TRANS_HIDE_STATUSBAR
                    STATE_STAT_NAV, 		// TRANS_SHOW_STATUSBAR
                    STATE_Z2, 				// TRANS_HIDE_SYSTEM_UI
                    STATE_STAT_NAV			// TRANS_SHOW_SYSTEM_UI
                },
                // STATE_NAV
                {
                    STATE_NAV, 		    	// TRANS_HIDE_STATUSBAR
                    STATE_STAT_NAV, 		// TRANS_SHOW_STATUSBAR
                    STATE_Z1, 				// TRANS_HIDE_SYSTEM_UI
                    STATE_NAV				// TRANS_SHOW_SYSTEM_UI
                },
                // STATE_Z1
                {
                    STATE_Z1, 				// TRANS_HIDE_STATUSBAR
                    STATE_Z2, 				// TRANS_SHOW_STATUSBAR
                    STATE_Z1, 				// TRANS_HIDE_SYSTEM_UI
                    STATE_NAV				// TRANS_SHOW_SYSTEM_UI
                },
                // STATE_Z2
                {
                    STATE_Z1, 				// TRANS_HIDE_STATUSBAR
                    STATE_Z2, 				// TRANS_SHOW_STATUSBAR
                    STATE_Z2, 				// TRANS_HIDE_SYSTEM_UI
                    STATE_STAT_NAV			// TRANS_SHOW_SYSTEM_UI
                },
            };

    private int mState = STATE_STAT_NAV;

    @NonNull
    private OnFullScreenStateChangedListener[] mCallbacks = new OnFullScreenStateChangedListener[NSTATES];

    @Nullable
    private OnFullScreenStateChangedListener stateChangedListener;

    @NonNull
    private final Activity activity;

    public FullScreenManager(@NonNull Activity activity) {
        this.activity = Objects.requireNonNull(activity, "activity");
    }

    public void setStateCallback(int state, OnFullScreenStateChangedListener callback) {
        mCallbacks[state] = callback;
    }

    public void setStateCallback(OnFullScreenStateChangedListener callback) {
        stateChangedListener = callback;
    }

    public int changeState(int transition) {
        int newState = FSM[mState][transition];
        if (newState != mState) {
            if (mCallbacks[newState] != null) {
                mCallbacks[newState].stateChanged(mState, newState);
            }

            if (stateChangedListener != null) {
                stateChangedListener.stateChanged(mState, newState);
            }
        }

        mState = newState;
        return mState;
    }

    public void callback() {
        if (mCallbacks[mState] != null) {
            mCallbacks[mState].stateChanged(mState, mState);
        }
    }

    public int getState() {
        return mState;
    }

    /**
     * Hides/Shows system toolbar with animation.
     *
     * @param visible visibility of system toolbar.
     */
    public void setStatusBarVisibility(boolean visible) {
        changeState(visible ? TRANS_SHOW_STATUSBAR : TRANS_HIDE_STATUSBAR);
    }

    public void setSystemUIVisibility(boolean visible) {
        changeState(visible ? TRANS_SHOW_SYSTEM_UI : TRANS_HIDE_SYSTEM_UI);
    }

    public boolean getSystemUIVisibility() {
        return getState() == STATE_NAV || getState() == STATE_STAT_NAV;
    }

    public boolean getStatusBarVisibility() {
        return mState == STATE_STAT_NAV;
    }

    public void showStatusBar() {
        activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FORCE_NOT_FULLSCREEN);
    }

    public void hideStatusBar() {
        activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FORCE_NOT_FULLSCREEN);
        activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
    }

    @SuppressLint("NewApi")
    public void hideSystemUI() {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT) {
             activity.getWindow().getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                            | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION // hide nav bar
                            | View.SYSTEM_UI_FLAG_FULLSCREEN // hide status bar
                            | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
            );
        }
    }

    @SuppressLint("NewApi")
    public void showSystemUI() {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT) {
            activity.getWindow().getDecorView().setSystemUiVisibility(0);
        }
    }

    public void unInitFullScreenFSM() {
        setStateCallback(STATE_STAT_NAV, null);
        setStateCallback(STATE_NAV, null);
        setStateCallback(STATE_Z1, null);
        setStateCallback(STATE_Z2, null);
    }

    public void initFullScreenFSM() {
        setStateCallback(STATE_STAT_NAV, new OnFullScreenStateChangedListener() {
            public void stateChanged(int oldState, int newState) {
                showStatusBar();
                showSystemUI();
            }
        });
        setStateCallback(STATE_NAV, new OnFullScreenStateChangedListener() {
            public void stateChanged(int oldState, int newState) {
                hideStatusBar();
                showSystemUI();
            }
        });
        OnFullScreenStateChangedListener hideEverything = new OnFullScreenStateChangedListener() {
            public void stateChanged(int oldState, int newState) {
                hideStatusBar();
                hideSystemUI();
            }
        };
        setStateCallback(STATE_Z1, hideEverything);
        setStateCallback(STATE_Z2, hideEverything);
    }
}
