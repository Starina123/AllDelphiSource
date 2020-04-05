package com.embarcadero.firemonkey.advertising;

public interface IAdListener {
	void onAdLoaded();
	void onAdFailedToLoad(int errorCode);
	void onAdOpened();
	void onAdClosed();
	void onAdLeftApplication();
}
