package com.embarcadero.firemonkey.dialogs.defaults;

import android.annotation.TargetApi;
import android.app.DialogFragment;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Bundle;
import android.view.WindowManager;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class FMXDefaultDialogFragment extends DialogFragment {
	// private static final String TAG = "FMXDialogFragment";
	private FMXDefaultStandardDialog mDialog = null;

	public void setDialog(FMXDefaultStandardDialog dialog) {
		mDialog = dialog;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		mDialog.getRealDialog().getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
	}
	
	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		return mDialog.getRealDialog();
	}

	@Override
	public void onDismiss(DialogInterface dialog) {
		if (mDialog.getListener() != null) {
			int result = mDialog.getModalResult();
			String[] values = null;
			if (FMXDefaultInputQueryDialog.class.isInstance(mDialog))
				values = ((FMXDefaultInputQueryDialog) mDialog).getValues();
			mDialog.getListener().onDialogClosed(result, values);
		}
		super.onDismiss(dialog);
	}
}
