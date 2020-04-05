package com.embarcadero.firemonkey;

import android.graphics.Rect;
import android.support.annotation.NonNull;

/**
 * Listener responses on getting new insets of Activity DecorView.
 */
public interface OnActivityInsetsChangedListener {

    /**
     * Called when decor view of activity window changed insets.
     *
     * @param newInsets new insets of Activity.getWindow.getDecorView
     */
    void insetsChanged(@NonNull Rect newInsets);
}
