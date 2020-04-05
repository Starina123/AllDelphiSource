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

import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.pickers.defaults.DefaultPickersFactory;
import com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadPickersFactory;

public abstract class BasePickersFactory {

	private static BasePickersFactory mFactory = null;

	abstract public BaseDateTimePicker createDatePicker(
			FMXNativeActivity activity);

	abstract public BaseDateTimePicker createTimePicker(
			FMXNativeActivity activity);

	abstract public BaseListPicker createListPicker(FMXNativeActivity activity);

	public static BasePickersFactory getFactory() {
		if (mFactory == null) {
			if ((VERSION.SDK_INT == VERSION_CODES.GINGERBREAD) || (VERSION.SDK_INT == VERSION_CODES.GINGERBREAD_MR1))
				mFactory = new GingerbreadPickersFactory();
			else
				mFactory = new DefaultPickersFactory();
		}

		return mFactory;
	}
}