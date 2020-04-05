package com.embarcadero.firemonkey.dialogs.defaults;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.os.Build;
import android.widget.EditText;
import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.FMXDialogHelpers;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class FMXDefaultInputQueryDialog extends FMXDefaultStandardDialog {
	private EditText[] mValueEdits;

	public FMXDefaultInputQueryDialog(FMXNativeActivity activity, int theme,
			String title, String[] prompts, String[] values, String[] captions) {
		super(activity);
		AlertDialog.Builder builder = new AlertDialog.Builder(activity, theme);
		mValueEdits = FMXDialogHelpers.generateInputQuery(activity, builder,
				title, prompts, values, captions, this);
		setFragmentDialog(builder.create());
	}

	public String[] getValues() {
		String[] values = new String[mValueEdits.length];
		for (int i = 0; i < mValueEdits.length; i++)
			values[i] = mValueEdits[i].getText().toString();
		return values;
	}
}
