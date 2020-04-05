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

import com.embarcadero.firemonkey.pickers.OnItemChangedListener;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;

@SuppressLint("NewApi")
public class ListPickerFragment extends DialogFragment {

	private AlertDialog mDialog = null;
	private CharSequence[] mItems = null;
	private int mItemIndex = -1;
	private int mTheme = 0;
	private OnItemChangedListener mListener = null;

	void setItems(CharSequence[] items) {
		mItems = items;
	}

	CharSequence[] getItems() {
		return mItems;
	}

	void setItemIndex(int itemIndex) {
		mItemIndex = itemIndex;
	}

	void setListener(OnItemChangedListener listener) {
		mListener = listener;
	}

	@SuppressLint("NewApi")
	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		AlertDialog.Builder builder = new AlertDialog.Builder(getActivity(), mTheme);
		builder.setSingleChoiceItems(mItems, mItemIndex, new DialogInterface.OnClickListener() {			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				if (mListener != null) {
					mListener.onItemChanged(which);
					dialog.dismiss();
				}				
			}
		});

		mDialog = builder.create();
		return mDialog;
	}

	@SuppressLint("NewApi")
	@Override
	public void onStart() {
		super.onStart();
		if (mListener != null) {
			mListener.onShow();
		}
	}
	
	@SuppressLint("NewApi")
	@Override
	public void onDismiss(DialogInterface dialog) {
		super.onDismiss(dialog);
		if (mListener != null) {
			mListener.onHide();
		}
	}

	public void setTheme(int theme) {
		mTheme = theme;
	}
}
