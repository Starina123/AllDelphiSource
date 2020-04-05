package com.embarcadero.firemonkey.text.filters;

import android.text.InputFilter;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;

/**
 * This filter will convert to lowercase all the upper case letters that are added through edits.
 */
public class AllLower implements InputFilter {

    public CharSequence filter(CharSequence source, int start, int end, Spanned dest, int dstart, int dend) {
        for (int i = start; i < end; i++) {
            if (Character.isUpperCase(source.charAt(i))) {
                char[] v = new char[end - start];
                TextUtils.getChars(source, start, end, v, 0);
                String s = new String(v).toLowerCase();

                if (source instanceof Spanned) {
                    SpannableString sp = new SpannableString(s);
                    TextUtils.copySpansFrom((Spanned) source, start, end, null, sp, 0);
                    return sp;
                } else {
                    return s;
                }
            }
        }
        return null; // keep original
    }
}