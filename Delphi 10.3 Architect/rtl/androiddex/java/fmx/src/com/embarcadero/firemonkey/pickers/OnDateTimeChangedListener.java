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

import java.util.Date;

public interface OnDateTimeChangedListener {

	void onDateChanged(Date date);

	void onHide();

	void onShow();

}