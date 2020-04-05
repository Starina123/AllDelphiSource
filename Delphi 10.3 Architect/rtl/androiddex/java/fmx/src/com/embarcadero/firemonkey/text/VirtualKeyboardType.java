package com.embarcadero.firemonkey.text;

import android.text.InputType;

/**
 * Enumeration used to control the type of onscreen keyboard to be displayed.
 */
public enum VirtualKeyboardType {

    /**
     * An alphanumeric keyboard for general text input.
     */
    TEXT(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES),

    /**
     * A numeric-only keyboard (10key-style)
     */
    NUMBER(InputType.TYPE_CLASS_NUMBER),

    /**
     * A keyboard that provides for numeric input and punctuation symbols.
     */
    NUMBER_AND_PUNCTUATION(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES),

    /**
     * A keyboard for entering a telephone number.
     */
    PHONE(InputType.TYPE_CLASS_PHONE),

    /**
     * An alphanumeric keyboard for general text input. The Alphabet keyboard type has no word completion/word suggestion.
     * The keyboard looks the same as the Default keyboard, but without suggestions.
     */
    ALPHABET(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES),

    /**
     * A keyboard for entering a Web URL (Uniform Resource Locator).
     */
    URL(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI),

    /**
     * An alphanumeric keyboard for general text input including a phone pad.
     */
    NAME_PHONE_PAD(InputType.TYPE_CLASS_PHONE),

    /**
     * An alphanumeric keyboard for entering Email addresses, typically with keys for "." and "@".
     */
    EMAIL_ADDRESS(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS),

    /**
     * A keyboard that provides for numeric input and ",".
     */
    NUMBER_DECIMAL(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL | InputType.TYPE_NUMBER_FLAG_SIGNED);

    private final int inputType;

    VirtualKeyboardType(int inputType) {
        this.inputType = inputType;
    }

    public int getInputType() {
        return inputType;
    }

    public boolean isTextClass() {
        return (inputType & InputType.TYPE_CLASS_TEXT) == InputType.TYPE_CLASS_TEXT;
    }

    public boolean isNumberClass() {
        return (inputType & InputType.TYPE_CLASS_NUMBER) == InputType.TYPE_CLASS_NUMBER;
    }
}
