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

import com.embarcadero.firemonkey.pickers.BaseDateTimePicker;
import com.embarcadero.firemonkey.pickers.OnDateTimeChangedListener;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.text.format.DateFormat;
import android.widget.TimePicker;

public class TimePickerFragment extends DialogFragment implements TimePickerDialog.OnTimeSetListener {

	private int mHour = 0;
	private int mMin = 0;
	private int mTheme = 0;
	private OnDateTimeChangedListener mListener = null;

	public TimePickerFragment(int hour, int min)
	{
		setTime(hour, min);
	}
	
	public void setTime(int hour, int min) {		
		mHour = hour;
		mMin = min;
	}

	public void setListener(OnDateTimeChangedListener listener) {
		mListener = listener;
	}

	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		return new TimePickerDialog(getActivity(), mTheme, this, mHour, mMin, DateFormat.is24HourFormat(getActivity()));
	}

	public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
		if (hasListener()) {
			final Calendar c = Calendar.getInstance(BaseDateTimePicker.getGMTTimeZone());
			c.set(Calendar.HOUR_OF_DAY, hourOfDay);
			c.set(Calendar.MINUTE, minute);			

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

	public void setTheme(int theme) {
		mTheme = theme;
	}
	
	private boolean hasListener() {
		return mListener != null;
	}
}