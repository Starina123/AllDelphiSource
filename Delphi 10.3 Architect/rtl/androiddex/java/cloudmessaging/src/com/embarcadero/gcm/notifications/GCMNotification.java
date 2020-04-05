package com.embarcadero.gcm.notifications;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.ComponentName;
import android.os.Bundle;
import android.support.v4.content.WakefulBroadcastReceiver;

public class GCMNotification extends WakefulBroadcastReceiver {

    // this one must really be static. yes.
    private static GCMNativeListener mListener;

    public void setNativeListener(GCMNativeListener listener) {
        // The application is running
        mListener = listener;
    }

    @Override
    public void onReceive(Context context, Intent intent) {

        if (mListener == null) {
            // Add to notification center
            ComponentName comp = new ComponentName(context.getPackageName(),
                    GCMIntentService.class.getName());
            startWakefulService(context, (intent.setComponent(comp)));
        } else {
            // Notifiy running application
            Bundle extras = intent.getExtras();
            if (extras == null) {
                extras = new Bundle();
            }

            mListener.OnNotificationReceived(extras);
        }
        setResultCode(Activity.RESULT_OK);
    }
}