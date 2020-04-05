package com.embarcadero.firemonkey.text.menu;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.os.Build;
import android.view.ActionMode;
import android.view.View;

/**
 * Callback interface for action modes with supporting specify content region in View.
 */
@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public interface OnTextContextMenuListener extends ActionMode.Callback {

    /**
     * Called when an ActionMode needs to be positioned on screen, potentially occluding view
     * content. Note this may be called on a per-frame basis.
     *
     * @param mode    The ActionMode that requires positioning.
     * @param view    The View that originated the ActionMode, in whose coordinates the Rect should
     *                be provided.
     * @param outRect The Rect to be populated with the content position. Use this to specify
     *                where the content in your app lives within the given view. This will be used
     *                to avoid occluding the given content Rect with the created ActionMode.
     */
    void onGetContentRect(ActionMode mode, View view, Rect outRect);
}
