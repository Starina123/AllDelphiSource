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
package com.embarcadero.firemonkey.pickers;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public abstract class BaseDateTimePicker extends BasePicker {

	protected OnDateTimeChangedListener mListener = null;
	protected int mYear = 0;
	protected int mMonth = 0;
	protected int mDay = 0;
	protected int mHour = 0;
	protected int mMinute = 0;

	protected static TimeZone mGMTTimeZone = TimeZone.getTimeZone("GMT+00:00");

	public BaseDateTimePicker() {
		setDate(System.currentTimeMillis());
	}

	public void setListener(OnDateTimeChangedListener listener) {
		mListener = listener;
	}

	public void setDate(long timeInMillis) {
		Calendar c = Calendar.getInstance(mGMTTimeZone);
		c.setTimeInMillis(timeInMillis);
		mYear = c.get(Calendar.YEAR);
		mMonth = c.get(Calendar.MONTH);
		mDay = c.get(Calendar.DAY_OF_MONTH);
		mHour = c.get(Calendar.HOUR_OF_DAY);
		mMinute = c.get(Calendar.MINUTE);
	}

	public Date getDate() {
		final Calendar c = Calendar.getInstance(mGMTTimeZone);
		c.set(Calendar.YEAR, mYear);
		c.set(Calendar.MONTH, mMonth);
		c.set(Calendar.DAY_OF_MONTH, mDay);

		return c.getTime();
	}

	public Date getTime() {
		final Calendar c = Calendar.getInstance(mGMTTimeZone);
		c.set(Calendar.HOUR_OF_DAY, mHour);
		c.set(Calendar.MINUTE, mMinute);

		return c.getTime();
	}

	public boolean hasListener() {
		return mListener != null;
	}

	public static TimeZone getGMTTimeZone() {
		return mGMTTimeZone;
	}

}