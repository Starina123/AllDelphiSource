package com.embarcadero.firemonkey.text.menu;

import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;

/**
 * Delegates {@link android.view.ActionMode.Callback} to Delphi side through {@link OnTextContextMenuListener}.
 */
@SuppressWarnings("unused")
public class DelegatedActionModeCallback implements ActionMode.Callback {

    private OnTextContextMenuListener onContextMenuListener;

    public DelegatedActionModeCallback(OnTextContextMenuListener onContextMenuListener) {
        if (onContextMenuListener == null) {
            throw new NullPointerException("onContextMenuListener");
        }
        this.onContextMenuListener = onContextMenuListener;
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
