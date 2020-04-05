package com.embarcadero.firemonkey.dialogs;

import com.embarcadero.firemonkey.FMXNativeActivity;

import android.app.Dialog;

public abstract class FMXStandardDialog {

	protected FMXNativeActivity activity = null;
	protected int modalResult = -1;
	protected Dialog mdialog;
	protected FMXDialogListener mlistener;

	protected void setModalResult(int result) {
		modalResult = result;
	}

	public Dialog getRealDialog() {
		return mdialog;
	}

	public int getModalResult() {
		return modalResult;
	}

	public void setListener(FMXDialogListener listener) {
		mlistener = listener;
	}

	public FMXDialogListener getListener() {
		return mlistener;
	}

	public abstract void hide();

	public abstract boolean isShown();

	public abstract void show();
}
