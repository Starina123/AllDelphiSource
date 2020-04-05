package com.embarcadero.firemonkey.keyboard;

import android.graphics.Rect;
import android.support.annotation.NonNull;

/**
 * Special listener for observing changing of soft keyboard state.
 */
public interface OnKeyboardStateChangedListener {

    /**
     * Virtual keyboard will shown.
     */
    void onVirtualKeyboardWillShown();

    /**
     * Virtual keyboard changed frame.
     *
     * @param newFrame new frame of keyboard
     */
    void onVirtualKeyboardFrameChanged(@NonNull Rect newFrame);

    /**
     * Virtual keyboard will hidden.
     */
    void onVirtualKeyboardWillHidden();
}
