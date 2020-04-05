package com.embarcadero.firemonkey.dialogs.defaults;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.FMXStandardDialog;

import android.annotation.TargetApi;
import android.app.Dialog;
import android.os.Build;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class FMXDefaultStandardDialog extends FMXStandardDialog {

	private FMXDefaultDialogFragment dialogFragment = new FMXDefaultDialogFragment();

	public FMXDefaultStandardDialog(FMXNativeActivity aActivity) {
		activity = aActivity;
	}

	protected void setFragmentDialog(Dialog dialog) {
		mdialog = dialog;
		dialogFragment.setDialog(this);
	}

	@Override
	public void hide() {
		if (dialogFragment != null)
			dialogFragment.dismiss();
	}

	@Override
	public boolean isShown() {
		if (dialogFragment != null)
			return dialogFragment.isVisible();
		else
			return false;
	}

	@Override
	public void show() {
		if (activity != null)
			dialogFragment.show(activity.getFragmentManager(), "FMXDialog");
	}
}
