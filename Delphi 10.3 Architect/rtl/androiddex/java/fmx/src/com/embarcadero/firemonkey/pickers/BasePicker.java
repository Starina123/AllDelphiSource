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

public abstract class BasePicker {

	protected int mTheme = 0;
	
	abstract public void show();

	abstract public void hide();

	abstract public boolean isShown();

	public void setTheme(int theme){
		mTheme = theme;
	}
}
