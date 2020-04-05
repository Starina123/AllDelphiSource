package com.embarcadero.firemonkey.broadcast;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class FMXBroadcastReceiver extends BroadcastReceiver {
	
	FMXBroadcastReceiverListener mListener;
	
	public FMXBroadcastReceiver(FMXBroadcastReceiverListener listener) {
		mListener = listener;
    }

	@Override
	public void onReceive(Context context, Intent intent) {
		mListener.onReceive(context, intent);
	}

}
