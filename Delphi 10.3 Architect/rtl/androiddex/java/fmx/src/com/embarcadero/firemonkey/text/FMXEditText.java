package com.embarcadero.firemonkey.text;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.SpanWatcher;
import android.text.Spannable;
import android.text.Spanned;
import android.text.TextWatcher;
import android.text.method.TextKeyListener;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.SystemServicesHelper;
import com.embarcadero.firemonkey.keyboard.VirtualKeyboard;
import com.embarcadero.firemonkey.text.filters.AllLower;
import com.embarcadero.firemonkey.text.filters.FilterChar;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Text input in the Android applications built on the NDK is limited and does not support a number of input features:
 * unicode symbols and IME input. These are critical areas for FMX. Therefore, in order to get these features in FMX,
 * we use a proxy approach with link the FMX and I/O system Java. We delegate logic of text input into
 * {@link InputConnection} through using {@link EditText} view. We monitor the state of text input through listeners
 * {@link FMXTextListener} and synchronize it with FMX {@code TTextService}.
 */
@SuppressWarnings("unused")
public class FMXEditText extends EditText {

    /**
     * See description of {@link ReturnKeyType}.
     */
    @NonNull
    private ReturnKeyType returnKeyType = ReturnKeyType.ENTER;

    /**
     * Determines the type of the virtual keyboard.
     */
    @NonNull
    private VirtualKeyboardType keyboardType = VirtualKeyboardType.TEXT;

    /**
     * See description of {@link CharCase}.
     */
    @NonNull
    private CharCase charCase = CharCase.NORMAL;

    /**
     * Specifies whether this edit control shows its characters or not.
     */
    private boolean isPassword = false;

    /**
     * Determines whether you can change the text of this edit control.
     */
    private boolean isReadOnly = false;

    /**
     * Defines characters which can be input in the edit field. All characters not in FilterChar will be ignored.
     * Empty FilterChars value means no filtering.
     */
    @Nullable
    private String filterChars;

    /**
     * Maximum length of text that can be input in the edit field.
     */
    private int maxLength = 0;

    /**
     * Specifies whether this edit control allows input text lines.
     */
    private boolean isMultiline = false;

    /**
     * Specifies whether this edit control shows soft keyboard, when user touches it.
     */
    private boolean isNeededToShowSoftKeyboardOnTouch = true;

    /**
     * Text change listeners.
     */
    @NonNull
    private final List<FMXTextListener> listeners = new ArrayList<FMXTextListener>();

    public FMXEditText(@NonNull Context context) {
        super(context);
        addTextChangedListener(new ChangeWatcher());
    }

    public FMXEditText(@NonNull Context context, AttributeSet attrs) {
        super(context, attrs);
        addTextChangedListener(new ChangeWatcher());
    }

    public FMXEditText(@NonNull Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        addTextChangedListener(new ChangeWatcher());
    }

    public void setReturnKeyType(@NonNull ReturnKeyType returnKeyType) {
        Objects.requireNonNull(returnKeyType, "returnKeyType");

        this.returnKeyType = returnKeyType;
        InputMethodManager imm = SystemServicesHelper.getServiceOrThrow(getContext(), Context.INPUT_METHOD_SERVICE, InputMethodManager.class);
        imm.restartInput(this);
    }

    @NonNull
    public ReturnKeyType getReturnKeyType() {
        return returnKeyType;
    }

    public void setKeyboardType(@NonNull VirtualKeyboardType keyboardType) {
        Objects.requireNonNull(keyboardType, "keyboardType");

        this.keyboardType = keyboardType;
        updateInputType();
    }

    @NonNull
    public VirtualKeyboardType getKeyboardType() {
        return keyboardType;
    }

    public void setCharCase(@NonNull CharCase charCase) {
        Objects.requireNonNull(charCase, "charCase");

        this.charCase = charCase;
        updateInputFilters();
    }

    @NonNull
    public CharCase getCharCase() {
        return charCase;
    }

    public void setPassword(boolean password) {
        isPassword = password;
        updateInputType();
    }

    public boolean isPassword() {
        return isPassword;
    }

    public void setReadOnly(boolean readOnly) {
        isReadOnly = readOnly;
        setEnabled(!isReadOnly);
        updateInputType();
    }

    public boolean isReadOnly() {
        return isReadOnly;
    }

    public void setFilterChars(@Nullable String filterChars) {
        this.filterChars = filterChars;
        updateInputFilters();
        // Filter chars affects on options of virtual keyboard.
        updateInputType();
    }

    @Nullable
    public String getFilterChars() {
        return filterChars;
    }

    public boolean hasFilterChars() {
        return filterChars != null && !Objects.equals(filterChars, "");
    }

    public void setMaxLength(int maxLength) {
        this.maxLength = Math.max(0, maxLength);
        updateInputFilters();
    }

    public int getMaxLength() {
        return maxLength;
    }

    public void setMultiline(boolean multiline) {
        isMultiline = multiline;
        setSingleLine(!isMultiline);
        updateInputType();
    }

    public boolean isMultiline() {
        return isMultiline;
    }

    public void addTextListener(@NonNull FMXTextListener textListener) {
        Objects.requireNonNull(textListener, "textListener");

        if (!listeners.contains(textListener)) {
            listeners.add(textListener);
        }
    }

    public void removeTextListener(@NonNull FMXTextListener textListener) {
        listeners.remove(textListener);
    }

    public void setNeededToShowSoftKeyboardOnTouch(boolean neededToShowSoftKeyboardOnTouch) {
        isNeededToShowSoftKeyboardOnTouch = neededToShowSoftKeyboardOnTouch;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        // This need is caused by a situation where the text field has focus and virtual keyboard was shown, but after
        // switching the application to another, the keyboard is hidden. After reopening the fmx application focus on
        // the text field remains however the keyboard does not appear. This method allows the user to display
        // the keyboard again after pressing the field
        if (isNeededToShowSoftKeyboardOnTouch) {
            VirtualKeyboard virtualKeyboard = ((FMXNativeActivity) getContext()).getVirtualKeyboard();
            virtualKeyboard.showFor(this);
        }
        // Make the text field transparent to touch, but keep the ability to track touch.
        return false;
    }

    @Override
    public void onEditorAction(int actionCode) {
        // Disable default processing logic of ReturnKey.
        if (actionCode == EditorInfo.IME_ACTION_DONE) {
            VirtualKeyboard virtualKeyboard = ((FMXNativeActivity) getContext()).getVirtualKeyboard();
            virtualKeyboard.hide(this);
        } else {
            // Delegate handle Editor action to FMX side.
            for (FMXTextListener listener : listeners) {
                listener.onEditorAction(actionCode);
            }
        }
    }

    @Override
    public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        InputConnection connection = super.onCreateInputConnection(outAttrs);
        int imeActions = outAttrs.imeOptions & EditorInfo.IME_MASK_ACTION;
        if ((imeActions & EditorInfo.IME_ACTION_NEXT) != 0) {
            // clear the existing action
            outAttrs.imeOptions ^= imeActions;

            // set the new action
            outAttrs.imeOptions |= returnKeyType.getImeOptions();
        }
        if (isMultiline) {
            // If it's a multiline text, we must disable a firing Actions on Enter (Return) key
            outAttrs.imeOptions |= EditorInfo.TYPE_TEXT_FLAG_MULTI_LINE | EditorInfo.IME_FLAG_NO_ENTER_ACTION;
        } else if ((outAttrs.imeOptions & EditorInfo.IME_FLAG_NO_ENTER_ACTION) != 0) {
            outAttrs.imeOptions &= ~EditorInfo.IME_FLAG_NO_ENTER_ACTION;
        }
        outAttrs.imeOptions |= EditorInfo.IME_FLAG_NO_EXTRACT_UI;
        return connection;
    }

    protected void updateInputType() {
        int inputType;
        if (isReadOnly) {
            inputType = InputType.TYPE_NULL;
        } else {
            inputType = keyboardType.getInputType();

            if (isMultiline) {
                inputType |= InputType.TYPE_TEXT_FLAG_MULTI_LINE;
            }

            // If user specified filter chars, we should disable word Suggestions list, because soft keyboard doesn't
            // know nothing about this filter and will suggest wrong words.
            if (hasFilterChars() && keyboardType.isTextClass()) {
                // Some implementation keyboards ignore TYPE_TEXT_FLAG_NO_SUGGESTIONS flag and anyway shows suggestions
                // words (For example this behavior was noticed on Xiaomi 5 and Google GBoard Keyboard).
                inputType |= InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS |
                             InputType.TYPE_TEXT_VARIATION_PASSWORD |
                             InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD;
            }

            if (isPassword) {
                if (keyboardType.isTextClass()) {
                    inputType = InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD
                            | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS
                            | InputType.TYPE_TEXT_VARIATION_WEB_PASSWORD;
                }

                if (keyboardType.isNumberClass()) {
                    inputType |= InputType.TYPE_NUMBER_VARIATION_PASSWORD;
                }

                if (isMultiline) {
                    inputType |= InputType.TYPE_TEXT_FLAG_MULTI_LINE;
                }

            }
        }
        setInputType(inputType);
        // EditText has default logic of processing key input events, which depends on input type.
        // For example, it filters forbidden symbols for numeric keyboard. But unfortunately
        // default filter for numeric keyboard doesn't allow to use "," until 26 API. We have
        // own logic of filtering chars in FMX side, so we disable it.
        //
        // setKeyListener internally update inputType for EditText.
        final int immutableInputType = inputType;
        setKeyListener(new TextKeyListener(TextKeyListener.Capitalize.SENTENCES, true) {
            @Override
            public int getInputType() {
                return immutableInputType;
            }
        });
    }

    protected void updateInputFilters() {
        ArrayList<InputFilter> filters = new ArrayList<InputFilter>();
        switch (charCase) {
            case UPPER_CASE:
                filters.add(new InputFilter.AllCaps());
                break;

            case LOWER_CASE:
                filters.add(new AllLower());
                break;
        }

        if (maxLength > 0) {
            filters.add(new InputFilter.LengthFilter(maxLength));
        }

        if (filterChars != null && filterChars.length() > 0) {
            filters.add(new FilterChar(filterChars));
        }

        InputFilter[] filtersArray = new InputFilter[filters.size()];
        for (int i = 0; i < filters.size(); ++i) {
            filtersArray[i] = filters.get(i);
        }
        setFilters(filtersArray);
    }   

    protected void copyToClipboard(@NonNull CharSequence text) {
        Objects.requireNonNull(text, "text");

        ClipboardManager service = SystemServicesHelper.getServiceOrThrow(getContext(), Context.CLIPBOARD_SERVICE, ClipboardManager.class);
        ClipData data = ClipData.newPlainText("text", text);
        service.setPrimaryClip(data);
    }

    private class ChangeWatcher implements TextWatcher, SpanWatcher {

        private static final String TAG = "ChangeWatcher";

        ChangeWatcher() {
        }

        public void beforeTextChanged(CharSequence buffer, int start, int before, int after) {
        }

        public void onTextChanged(CharSequence buffer, int start, int before, int after) {
            for (FMXTextListener listener : listeners) {
                listener.onTextUpdated(buffer, start + after);
            }
        }

        public void afterTextChanged(Editable buffer) {
            buffer.removeSpan(this);
            buffer.setSpan(this, 0, buffer.length(), Spanned.SPAN_INCLUSIVE_INCLUSIVE);
        }

        public void onSpanChanged(Spannable buf, Object what, int s, int e, int st, int en) {
        }

        public void onSpanAdded(Spannable buf, Object what, int s, int e) {
            if ((buf.getSpanFlags(what) & Spanned.SPAN_COMPOSING) == Spanned.SPAN_COMPOSING)
                for (FMXTextListener listener : listeners) {
                    listener.onComposingText(s, e);
                }
        }

        public void onSpanRemoved(Spannable buf, Object what, int s, int e) {
            for (FMXTextListener listener : listeners) {
                listener.onComposingText(-1, -1);
            }
        }
    }
}
