package com.embarcadero.firemonkey.broadcast;

import android.content.Context;
import android.content.Intent;

public interface FMXBroadcastReceiverListener {
	public void onReceive(Context context, Intent intent);
}
