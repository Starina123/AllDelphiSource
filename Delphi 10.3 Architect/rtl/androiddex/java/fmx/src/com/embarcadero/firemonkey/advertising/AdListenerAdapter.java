package com.embarcadero.firemonkey.advertising;

import com.google.android.gms.ads.AdListener;

public class AdListenerAdapter extends AdListener {
	private final IAdListener mListener;
	
	public AdListenerAdapter(IAdListener listener) {
		mListener = listener;
	}

	public void onAdLoaded() {
		mListener.onAdLoaded();
	}

	public void onAdFailedToLoad(int errorCode) {
		mListener.onAdFailedToLoad(errorCode);
	}

	public void onAdOpened() {
		mListener.onAdOpened();
	}

	public void onAdClosed() {
		mListener.onAdClosed();
	}

	public void onAdLeftApplication() {
		mListener.onAdLeftApplication();
	}
}
