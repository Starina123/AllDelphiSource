package com.embarcadero.firemonkey.text.filters;

import android.text.InputFilter;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;

/**
 * This filter will remove all forbidden letters that are added through edits.
 */
public class FilterChar implements InputFilter {

    private String filter;

    public FilterChar(CharSequence filterChar) {
        this.filter = filterChar.toString();
    }

    public CharSequence filter(CharSequence source, int start, int end, Spanned dest, int dstart, int dend) {
        boolean keepOriginal = true;
        StringBuilder sb = new StringBuilder(end - start);
        for (int i = start; i < end; i++) {
            char c = source.charAt(i);
            if (filter.contains(source.subSequence(i, i + 1))) {
                sb.append(c);
            } else {
                keepOriginal = false;
            }
        }
        if (keepOriginal)
            return null;
        else {
            if (source instanceof Spanned) {
                SpannableString sp = new SpannableString(sb);
                TextUtils.copySpansFrom((Spanned) source, start, sb.length(), null, sp, 0);
                return sp;
            } else {
                return sb;
            }
        }
    }
}