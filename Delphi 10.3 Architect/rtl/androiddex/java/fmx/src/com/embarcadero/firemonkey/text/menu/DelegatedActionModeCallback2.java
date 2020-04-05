package com.embarcadero.firemonkey.text.menu;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.os.Build;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import java.util.Objects;

/**
 * Delegates {@link android.view.ActionMode.Callback2} to Delphi side through {@link OnTextContextMenuListener}.
 */
@TargetApi(Build.VERSION_CODES.M)
@SuppressWarnings("unused")
public class DelegatedActionModeCallback2 extends ActionMode.Callback2 {

    private OnTextContextMenuListener onContextMenuListener;

    public DelegatedActionModeCallback2(OnTextContextMenuListener onContextMenuListener) {
        this.onContextMenuListener = Objects.requireNonNull(onContextMenuListener, "onContextMenuListener");
    }

    @Override
    public void onGetContentRect(ActionMode mode, View view, Rect outRect) {
        onContextMenuListener.onGetContentRect(mode, view, outRect);
    }

    @Override
    public boolean onCreateActionMode(ActionMode mode, Menu menu) {
        return onContextMenuListener.onCreateActionMode(mode, menu);
    }

    @Override
    public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
        return onContextMenuListener.onPrepareActionMode(mode, menu);
    }

    @Override
    public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
        return onContextMenuListener.onActionItemClicked(mode, item);
    }

    @Override
    public void onDestroyActionMode(ActionMode mode) {
        onContextMenuListener.onDestroyActionMode(mode);
    }
}
