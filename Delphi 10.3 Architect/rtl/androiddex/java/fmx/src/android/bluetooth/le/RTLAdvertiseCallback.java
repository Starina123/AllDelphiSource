package android.bluetooth.le;

import android.annotation.SuppressLint;

@SuppressLint("NewApi")
public class RTLAdvertiseCallback extends AdvertiseCallback {

	private	RTLAdvertiseListener mListener;
	
	public RTLAdvertiseCallback(RTLAdvertiseListener listener) {
		setListener(listener);
	}
	
	public void setListener(RTLAdvertiseListener listener) {
		mListener = listener;
	}
	
	public void onStartFailure(int errorCode){
		if (mListener != null) {
			mListener.onStartFailure(errorCode);
		}
	}	
	public void onStartSuccess(AdvertiseSettings settingsInEffect){
		if (mListener != null) {
			mListener.onStartSuccess(settingsInEffect);
		}
	}
	
}