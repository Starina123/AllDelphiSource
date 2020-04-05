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

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.pickers.BaseDateTimePicker;
import com.embarcadero.firemonkey.pickers.BaseListPicker;
import com.embarcadero.firemonkey.pickers.BasePickersFactory;

public class DefaultPickersFactory extends BasePickersFactory {

	@Override
	public BaseDateTimePicker createDatePicker(FMXNativeActivity activity) {
		return new DefaultDatePicker(activity);
	}

	@Override
	public BaseDateTimePicker createTimePicker(FMXNativeActivity activity) {
		return new DefaultTimePicker(activity);
	}

	@Override
	public BaseListPicker createListPicker(FMXNativeActivity activity) {
		return new DefaultListPicker(activity);
	}

}
