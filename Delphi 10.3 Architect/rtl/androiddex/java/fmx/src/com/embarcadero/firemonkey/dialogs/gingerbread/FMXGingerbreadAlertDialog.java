package com.embarcadero.firemonkey.dialogs.gingerbread;

import android.app.AlertDialog;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.FMXDialogHelpers;

public class FMXGingerbreadAlertDialog extends FMXGingerbreadStandardDialog {
	public FMXGingerbreadAlertDialog(FMXNativeActivity activity, int theme,
			String msg, int dlgType, final String[] captions,
			final int posButton, final int negButton, final int neutralButton) {
		super(activity);
		AlertDialog.Builder builder = new AlertDialog.Builder(activity);
		FMXDialogHelpers.generateAlertDialog(activity, builder, msg, dlgType,
				captions, posButton, negButton, neutralButton, this);
		mdialog = builder.create();
	}
}
