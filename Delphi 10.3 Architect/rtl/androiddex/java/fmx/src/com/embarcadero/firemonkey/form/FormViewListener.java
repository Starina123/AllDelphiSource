package com.embarcadero.firemonkey.form;

import android.view.MotionEvent;

/**
 * Listener of main events in FireMonkey form's view {@link FormView}.
 */
public interface FormViewListener {

    /**
     * View was touched.
     *
     * @param event touch information.
     * @return true - touch was processed and don't need to pass it to parent view. False - otherwise.
     */
    boolean onTouchEvent(MotionEvent event);

    /**
     * Form's view changed size.
     */
    void onSizeChanged(int newWidth, int newHeight, int oldWidth, int oldHeight);
}