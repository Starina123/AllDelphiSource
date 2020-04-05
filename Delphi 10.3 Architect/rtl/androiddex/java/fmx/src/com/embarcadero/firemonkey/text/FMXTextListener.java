package com.embarcadero.firemonkey.text;

/**
 * Listener changes the state of the text input in {@link FMXEditText}.
 */
public interface FMXTextListener {

    /**
     * Text was changed.
     *
     * @param text           new text
     * @param cursorPosition new position of cursor
     */
    void onTextUpdated(CharSequence text, int cursorPosition);

    /**
     * Bounds of composing text were changed.
     *
     * @param beginPosition start position of composing text
     * @param endPosition   end position of composing text
     */
    void onComposingText(int beginPosition, int endPosition);

    /**
     * User pressed action button.
     *
     * @param actionCode {@link EditorInfo}
     */
    void onEditorAction(int actionCode);
}
