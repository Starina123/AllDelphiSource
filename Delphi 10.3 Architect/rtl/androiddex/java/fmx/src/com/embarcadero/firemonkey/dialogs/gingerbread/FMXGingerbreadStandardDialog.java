package com.embarcadero.firemonkey.dialogs.gingerbread;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.dialogs.FMXStandardDialog;

public class FMXGingerbreadStandardDialog extends FMXStandardDialog {

	public FMXGingerbreadStandardDialog(FMXNativeActivity aActivity) {
		activity = aActivity;
	}

	@Override
	public void setModalResult(int result) {
		super.setModalResult(result);
		if (mlistener != null) {
			String[] values = null;
			if (FMXGingerbreadInputQueryDialog.class.isInstance(this))
				values = ((FMXGingerbreadInputQueryDialog) this).getValues();
			mlistener.onDialogClosed(modalResult, values);
		}		
	}
	@Override
	public void hide() {
		getRealDialog().dismiss();
	}

	@Override
	public boolean isShown() {
		if (mdialog != null)
			return mdialog.isShowing();
		else
			return false;
	}

	@Override
	public void show() {
		if (activity != null)
			mdialog.show();
	}

}
