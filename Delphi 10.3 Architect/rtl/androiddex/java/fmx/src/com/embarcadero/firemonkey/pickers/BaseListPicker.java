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

import android.app.AlertDialog;

public abstract class BaseListPicker extends BasePicker {

	protected int mItemIndex = AlertDialog.THEME_TRADITIONAL;
	protected CharSequence[] mItems = null;
	protected OnItemChangedListener mListener = null;

	public void setItems(CharSequence[] items)
	{
		mItems = items;
	}
	
	public void setItemIndex(int itemIndex) {
		mItemIndex = itemIndex;
	}
	
	public void setListener(OnItemChangedListener listener) {
		mListener = listener;
	}
	
	public boolean hasListener(){
		return mListener != null;
	}
}
