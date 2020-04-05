package com.embarcadero.firemonkey.addressbook;

import android.database.ContentObserver;

public class AddressBookObserver extends ContentObserver {

	private OnAddressBookChangesListener mListener;

	public AddressBookObserver(OnAddressBookChangesListener listener) {
		super(null);
		mListener = listener;
	}

	public void onChange(boolean selfChange) {
		super.onChange(selfChange);
		if (mListener != null)
			mListener.onChanged(selfChange);
	}
}
