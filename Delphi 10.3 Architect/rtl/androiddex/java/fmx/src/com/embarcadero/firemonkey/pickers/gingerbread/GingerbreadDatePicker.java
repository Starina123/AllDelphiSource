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

import android.app.DatePickerDialog;
import android.app.DatePickerDialog.OnDateSetListener;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnShowListener;
import android.widget.DatePicker;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.pickers.BaseDateTimePicker;
import com.embarcadero.firemonkey.pickers.GeneratorPickerID;

public class GingerbreadDatePicker extends BaseDateTimePicker implements OnDateSetListener, OnDismissListener,
		OnShowListener {
	private FMXNativeActivity mActivity = null;
	private DatePickerDialog mPicker = null;
	private int mId = 0;

	public GingerbreadDatePicker(FMXNativeActivity activity) {
		super();
		mActivity = activity;
		mPicker = new DatePickerDialog(mActivity, this, mYear, mMonth, mDay);
		mPicker.setOnDismissListener(this);
		mPicker.setOnShowListener(this);
	}

	@Override
	public void show() {
		if (mActivity != null) {
			mId = GeneratorPickerID.getUniqueID();
			mPicker.updateDate(mYear, mMonth, mDay);
			mActivity.showDialog(mId, mPicker);
		}
	}

	@SuppressWarnings("deprecation")
	@Override
	public void hide() {
		if (isShown()) {
			mPicker.dismiss();
			mActivity.removeDialog(mId);
		}
	}

	@Override
	public boolean isShown() {
		if (mPicker != null)
			return mPicker.isShowing();
		else
			return false;
	}

	@Override
	public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
		if (hasListener()) {
			mYear = year;
			mMonth = monthOfYear;
			mDay = dayOfMonth;
			mListener.onDateChanged(getDate());
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
