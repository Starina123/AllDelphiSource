package com.embarcadero.firemonkey.dialogs.defaults;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.os.Build;
import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.FMXDialogHelpers;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class FMXDefaultAlertDialog extends FMXDefaultStandardDialog {

	public FMXDefaultAlertDialog(FMXNativeActivity activity, int theme,
			String msg, int dlgType, final String[] captions,
			final int posButton, final int negButton, final int neutralButton) {
		super(activity);
		AlertDialog.Builder builder = new AlertDialog.Builder(activity, theme);
		FMXDialogHelpers.generateAlertDialog(activity, builder, msg, dlgType,
				captions, posButton, negButton, neutralButton, this);
		setFragmentDialog(builder.create());
	}
}
