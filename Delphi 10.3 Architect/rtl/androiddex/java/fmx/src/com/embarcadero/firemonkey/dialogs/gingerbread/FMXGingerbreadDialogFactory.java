package com.embarcadero.firemonkey.dialogs.gingerbread;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.FMXDialogFactory;
import com.embarcadero.firemonkey.dialogs.FMXStandardDialog;

public class FMXGingerbreadDialogFactory extends FMXDialogFactory {

	@Override
	public FMXStandardDialog createMessageDialog(FMXNativeActivity activity,
			int theme, String msg, int dlgType, final String[] captions,
			final int posButton, final int negButton, final int neutralButton) {
		return new FMXGingerbreadAlertDialog(activity, theme, msg, dlgType,
				captions, posButton, negButton, neutralButton);
	}

	@Override
	public FMXStandardDialog createInputQueryDialog(FMXNativeActivity activity,
			int theme, String title, String[] prompts, String[] values,
			String[] captions) {
		return new FMXGingerbreadInputQueryDialog(activity, theme, title,
				prompts, values, captions);
	}
}
