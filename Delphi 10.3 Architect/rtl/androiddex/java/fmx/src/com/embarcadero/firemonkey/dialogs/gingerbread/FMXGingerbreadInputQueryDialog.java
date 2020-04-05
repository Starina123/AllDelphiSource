package com.embarcadero.firemonkey.dialogs.gingerbread;

import android.app.AlertDialog;
import android.widget.EditText;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.FMXDialogHelpers;

public class FMXGingerbreadInputQueryDialog extends
		FMXGingerbreadStandardDialog {
	private EditText[] mValueEdits;

	public FMXGingerbreadInputQueryDialog(FMXNativeActivity activity,
			int theme, String title, String[] prompts, String[] values,
			String[] captions) {
		super(activity);
		AlertDialog.Builder builder = new AlertDialog.Builder(activity);
		mValueEdits = FMXDialogHelpers.generateInputQuery(activity, builder,
				title, prompts, values, captions, this);
		mdialog = builder.create();
	}

	public String[] getValues() {
		String[] values = new String[mValueEdits.length];
		for (int i = 0; i < mValueEdits.length; i++)
			values[i] = mValueEdits[i].getText().toString();
		return values;
	}
}
