/**
 * {*******************************************************}
 * {                                                       }
 * {            Delphi FireMonkey Pickers Service          }
 * {                                                       }
 * {          Implementation of Pickers for Android        }
 * {                                                       }
 * { Copyright(c) 2013-2014 Embarcadero Technologies, Inc. }
 * {                                                       }
 * {*******************************************************}
 */
package com.embarcadero.firemonkey.pickers.defaults;

import android.annotation.TargetApi;
import android.os.Build;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.pickers.BaseListPicker;
import com.embarcadero.firemonkey.pickers.OnItemChangedListener;

public class DefaultListPicker extends BaseListPicker {

	private ListPickerFragment mPicker = new ListPickerFragment();
	private FMXNativeActivity mActivity = null;

	public DefaultListPicker(FMXNativeActivity activity) {
		mActivity = activity;
	}

	public void setItemIndex(int itemIndex) {
		mPicker.setItemIndex(itemIndex);
	}

	public void setItems(CharSequence[] items) {
		mPicker.setItems(items);
	}

	public void setListener(OnItemChangedListener listener) {
		mPicker.setListener(listener);
	}

	public void hide() {
		if (mPicker != null)
			mPicker.dismiss();
	}

	public boolean isShown() {
		if (mPicker != null)
			return mPicker.isVisible();
		else
			return false;
	}

	@Override
	public void show() {		
		if ((mPicker.getItems().length > 0) && (mActivity != null) && (!mPicker.isAdded()))
			mPicker.show(mActivity.getFragmentManager(), "ListPicker");
	}

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	public void setTheme(int theme) {
		super.setTheme(theme);
		mPicker.setTheme(mTheme);
	}
}
