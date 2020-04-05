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
package com.embarcadero.firemonkey.pickers.gingerbread;

import android.app.TimePickerDialog;
import android.app.TimePickerDialog.OnTimeSetListener;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnShowListener;
import android.text.format.DateFormat;
import android.widget.TimePicker;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.pickers.BaseDateTimePicker;
import com.embarcadero.firemonkey.pickers.GeneratorPickerID;

public class GingerbreadTimePicker extends BaseDateTimePicker implements OnTimeSetListener, OnDismissListener,
		OnShowListener {
	private FMXNativeActivity mActivity = null;
	private TimePickerDialog mPicker = null;
	private int mId = 0;

	public GingerbreadTimePicker(FMXNativeActivity activity) {
		super();
		mActivity = activity;
		mPicker = new TimePickerDialog(mActivity, this, 0, 0, DateFormat.is24HourFormat(mActivity));
		mPicker.setOnDismissListener(this);
		mPicker.setOnShowListener(this);
	}

	@Override
	public void show() {
		if (mActivity != null) {
			mId = GeneratorPickerID.getUniqueID();
			mPicker.updateTime(mHour, mMinute);
			mActivity.showDialog(mId, mPicker);
		}
	}

	@SuppressWarnings("deprecation")
	@Override
	public void hide() {
		if (mPicker != null) {
			mPicker.dismiss();
			mActivity.removeDialog(mId);
		}
	}

	@Override
	public boolean isShown() {
		return mPicker.isShowing();
	}

	@Override
	public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
		if (mListener != null) {
			mHour = hourOfDay;
			mMinute = minute;

			mListener.onDateChanged(getTime());
		}
	}

	@Override
	public void onShow(DialogInterface dialog) {
		if (hasListener())
			mListener.onShow();
	}

	@Override
	public void onDismiss(DialogInterface dialog) {
		if (hasListener())
			mListener.onHide();
	}
}
