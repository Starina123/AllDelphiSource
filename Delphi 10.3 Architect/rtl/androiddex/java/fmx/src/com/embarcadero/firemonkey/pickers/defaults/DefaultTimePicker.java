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

public class DefaultTimePicker extends BaseDateTimePicker {

	private TimePickerFragment mPicker;
	private FMXNativeActivity mActivity = null;

	public DefaultTimePicker(FMXNativeActivity activity) {
		super();
		mPicker = new TimePickerFragment(mHour, mMinute);
		mActivity = activity;
	}

	public void setListener(OnDateTimeChangedListener listener) {
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
		if ((mActivity != null) && (!mPicker.isAdded())) {
			mPicker.setTime(mHour, mMinute);
			mPicker.show(mActivity.getFragmentManager(), "TimePicker");
		}
	}

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	public void setTheme(int theme) {
		super.setTheme(theme);
		mPicker.setTheme(mTheme);
	}
}
