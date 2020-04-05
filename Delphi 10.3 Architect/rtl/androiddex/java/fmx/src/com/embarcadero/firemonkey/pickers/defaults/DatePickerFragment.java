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

import java.util.Calendar;
import java.util.Date;

import com.embarcadero.firemonkey.pickers.BaseDateTimePicker;
import com.embarcadero.firemonkey.pickers.OnDateTimeChangedListener;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.os.Bundle;
import android.widget.DatePicker;

public class DatePickerFragment extends DialogFragment implements DatePickerDialog.OnDateSetListener {

	private DatePickerDialog mPickerDialog;
	private int mYear;
	private int mMonth;
	private int mDay;
	private long mMinDate;
	private long mMaxDate;
	private boolean mHasDateConstraints = false;
	private int mTheme = 0;
	private OnDateTimeChangedListener mListener = null;

	public DatePickerFragment(int year, int month, int day){
		setDate(year, month, day);
	}
	
	public void setMinDate(Date date) {
		mMinDate = Math.min(date.getTime(), mMaxDate);
	}

	public void setMaxDate(Date date) {
		mMaxDate = Math.max(date.getTime(), mMinDate);
	}

	public void setHasDateConstraints(boolean hasDateConstraints) {
		mHasDateConstraints = hasDateConstraints;
	}

	public void setDate(int year, int month, int day) {
		mYear = year;
		mMonth = month;
		mDay = day;
	}

	public void setListener(OnDateTimeChangedListener listener) {
		mListener = listener;
	}

	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		mPickerDialog = new DatePickerDialog(getActivity(), mTheme, this, mYear, mMonth, mDay);
		if (mHasDateConstraints) {
			mPickerDialog.getDatePicker().setMinDate(mMinDate);
			mPickerDialog.getDatePicker().setMaxDate(mMaxDate);
		}

		return mPickerDialog;
	}

	public void onDateSet(DatePicker view, int year, int month, int day) {
		if (hasListener()) {
			final Calendar c = Calendar.getInstance(BaseDateTimePicker.getGMTTimeZone());
			c.set(Calendar.YEAR, year);
			c.set(Calendar.MONTH, month);
			c.set(Calendar.DAY_OF_MONTH, day);
			mListener.onDateChanged(c.getTime());
		}
	}

	@Override
	public void onStart() {
		super.onStart();
		if (hasListener()) {
			mListener.onShow();
		}
	}

	public void onStop() {
		super.onStop();
		if (hasListener()) {
			mListener.onHide();
		}
	}

	private boolean hasListener() {
		return mListener != null;
	}

	public void setTheme(int theme) {
		mTheme = theme;
	}
}
