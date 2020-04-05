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
import com.embarcadero.firemonkey.pickers.BaseDateTimePicker;
import com.embarcadero.firemonkey.pickers.OnDateTimeChangedListener;
import com.embarcadero.firemonkey.pickers.defaults.DatePickerFragment;

public class DefaultDatePicker extends BaseDateTimePicker {

	private DatePickerFragment mPicker;
	private FMXNativeActivity mActivity = null;

	public DefaultDatePicker(FMXNativeActivity activity) {
		super();
		mPicker = new DatePickerFragment(mYear, mMonth, mDay);
		mActivity = activity;
	}

	public void setListener(OnDateTimeChangedListener listener) {
		if (mPicker != null)
			mPicker.setListener(listener);
	}

	public void hide() {
		if (isShown())
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
		if ((mActivity != null) && (!mPicker.isAdded()))
		{
			mPicker.setDate(mYear, mMonth, mDay);
			mPicker.show(mActivity.getFragmentManager(), "DatePicker");
		}
	}

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	public void setTheme(int theme) {
		super.setTheme(theme);
		mPicker.setTheme(mTheme);
	}
}