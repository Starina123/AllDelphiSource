package com.embarcadero.firemonkey.dialogs;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultDialogFactory;
import com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadDialogFactory;

import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;

public abstract class FMXDialogFactory {
	private static FMXDialogFactory factory = null;

	public abstract FMXStandardDialog createMessageDialog(
			FMXNativeActivity activity, int theme, String msg, int dlgType,
			final String[] captions, final int posButton, final int negButton,
			final int neutralButton);

	public abstract FMXStandardDialog createInputQueryDialog(
			FMXNativeActivity activity, int theme, String title,
			String[] prompts, String[] values, String[] captions);

	public static FMXDialogFactory getFactory() {
		if (factory == null) {
			if ((VERSION.SDK_INT == VERSION_CODES.GINGERBREAD)
					|| (VERSION.SDK_INT == VERSION_CODES.GINGERBREAD_MR1))
				factory = new FMXGingerbreadDialogFactory();
			else
				factory = new FMXDefaultDialogFactory();
		}
		return factory;
	}
}
