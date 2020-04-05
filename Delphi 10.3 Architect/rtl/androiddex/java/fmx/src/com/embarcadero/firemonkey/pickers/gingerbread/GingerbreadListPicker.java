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

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnShowListener;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.pickers.BaseListPicker;
import com.embarcadero.firemonkey.pickers.GeneratorPickerID;

public class GingerbreadListPicker extends BaseListPicker implements OnDismissListener, OnShowListener {

	private FMXNativeActivity mActivity = null;
	private AlertDialog mPicker = null;
	private int mId = 0;

	public GingerbreadListPicker(FMXNativeActivity activity) {
		mActivity = activity;
	}

	public void createNativePicker() {
		AlertDialog.Builder builder = new AlertDialog.Builder(mActivity);
		builder.setSingleChoiceItems(mItems, mItemIndex, new DialogInterface.OnClickListener() {			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				if (mListener != null) {
					mListener.onItemChanged(which);
					dialog.dismiss();
				}				
			}
		});
		mPicker = builder.create();
		mPicker.setOnDismissListener(this);
		mPicker.setOnShowListener(this);
	}

	@Override
	public void show() {
		if (mActivity != null) {
			mId = GeneratorPickerID.getUniqueID();
			createNativePicker();
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
		if (mPicker != null)
			return mPicker.isShowing();
		else
			return false;
	}

	@Override
	public void onDismiss(DialogInterface dialog) {
		if (hasListener())
			mListener.onHide();
	}

	@Override
	public void onShow(DialogInterface dialog) {
		if (hasListener())
			mListener.onShow();
	}
}
