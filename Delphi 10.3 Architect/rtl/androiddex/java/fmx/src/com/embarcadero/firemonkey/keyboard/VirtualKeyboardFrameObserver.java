package com.embarcadero.firemonkey.keyboard;

import android.graphics.Rect;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager.LayoutParams;
import android.widget.LinearLayout;
import android.widget.PopupWindow;

import com.embarcadero.firemonkey.FMXNativeActivity;

import java.util.Objects;

/**
 * Observer of Virtual Keyboard frame. Main idea is placing a invisible popup window, which is able to track
 * of its size. When virtual keyboard is appeared, Android changes size of this popup window on size of virtual keyboard.
 * <p/>
 * We specially banned changes size of window for Activity Window, because we use SurfaceView for forms and changes
 * size of window causes the OpenGL context to be recreated. What affects the delay in displaying the form at this moment.
 */
public class VirtualKeyboardFrameObserver extends PopupWindow implements View.OnLayoutChangeListener {

    @NonNull
    private final FMXNativeActivity activity;

    /**
     * Container of fmx forms.
     */
    @NonNull
    private final ViewGroup activityContentView;

    /**
     * Container of invisible popup window.
     */
    @NonNull
    private final LinearLayout popupContentView;

    /**
     * Listener of virtual keyboard frame changes events.
     */
    @Nullable
    private OnVirtualKeyboardFrameChangedListener listener;

    private boolean isVirtualKeyboardShown = false;

    VirtualKeyboardFrameObserver(@NonNull FMXNativeActivity activity) {
        super(activity);
        this.activity = Objects.requireNonNull(activity, "activity");
        this.popupContentView = new LinearLayout(activity);
        this.popupContentView.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        this.activityContentView = activity.findViewById(android.R.id.content);

        setContentView(popupContentView);

        // Allows to adjust window size, when virtual keyboard is appeared.
        setSoftInputMode(LayoutParams.SOFT_INPUT_ADJUST_RESIZE | LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
        setInputMethodMode(PopupWindow.INPUT_METHOD_NEEDED);

        // Makes window transparent for user.
        setHeight(LayoutParams.MATCH_PARENT);
        setWidth(0);
        setBackgroundDrawable(null);

        // Subscribes on monitoring changes of popup window frame.
        popupContentView.addOnLayoutChangeListener(this);
        activityContentView.post(new Runnable() {
            public void run() {
                startObservation();
            }
        });
    }

    /**
     * Starts monitoring of virtual keyboard frame changes.
     */
    private void startObservation() {
        if (!isShowing() && activityContentView.getWindowToken() != null) {
            showAtLocation(activityContentView, Gravity.NO_GRAVITY, 0, 0);
        }
    }

    /**
     * Returns true - keyboard is visible, false - otherwise.
     */
    public boolean isVirtualKeyboardShown() {
        return this.isVirtualKeyboardShown;
    }

    /**
     * Stops monitoring of virtual keyboard frame changes.
     */
    public void stopObservation() {
        dismiss();
    }

    /**
     * Sets listener for observing changes of virtual keyboard frame.
     */
    public void setListener(@Nullable OnVirtualKeyboardFrameChangedListener listener) {
        this.listener = listener;
    }

    @Override
    public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight,
                               int oldBottom) {
        if (listener == null) {
            return;
        }

        Rect popupRect = new Rect();
        popupContentView.getWindowVisibleDisplayFrame(popupRect);

        Rect windowInsets = activity.getWindowInsets();
        int height = activity.getWindow().getDecorView().getHeight();

        Rect keyboardFrame = new Rect(0, popupRect.bottom, activityContentView.getWidth(), height - windowInsets.bottom);
        isVirtualKeyboardShown = keyboardFrame.height() > 0;
        listener.onVirtualKeyboardFrameChanged(keyboardFrame);
    }

    interface OnVirtualKeyboardFrameChangedListener {
        /**
         * Virtual keyboard changed its frame.
         *
         * @param newFrame new frame of keyboard
         */
        void onVirtualKeyboardFrameChanged(@NonNull Rect newFrame);
    }
}
