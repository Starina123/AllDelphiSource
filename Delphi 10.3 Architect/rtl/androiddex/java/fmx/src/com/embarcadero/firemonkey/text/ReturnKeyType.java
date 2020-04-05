package com.embarcadero.firemonkey.text;

import android.view.inputmethod.EditorInfo;

/**
 * Type of action that an edit control performs when you are editing the text of the control and you press the return
 * key on the virtual keyboard.
 * <p/>
 * When you assign one of these values to the ReturnKeyType property of an edit control, the run-time platform uses
 * this value to determine the type of return button that it displays on the virtual keyboard for the edit control.
 */
public enum ReturnKeyType {

    // Don't use EditorInfo.IME_ACTION_NONE!
    // It has unpredictable behaviour on different keyboards. In particular, it results in invalid caret return
    // in single-line input.
    ENTER(EditorInfo.IME_ACTION_DONE),
    NEXT(EditorInfo.IME_ACTION_NEXT),
    DONE(EditorInfo.IME_ACTION_DONE),
    GO(EditorInfo.IME_ACTION_GO),
    SEARCH(EditorInfo.IME_ACTION_SEARCH),
    SEND(EditorInfo.IME_ACTION_SEND);

    private int imeOptions;

    ReturnKeyType(int imeOptions) {
        this.imeOptions = imeOptions;
    }

    public int getImeOptions() {
        return imeOptions;
    }
}
