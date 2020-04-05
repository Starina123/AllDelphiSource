package com.embarcadero.gcm.notifications;

import android.app.IntentService;
import android.content.Intent;
import com.embarcadero.rtl.notifications.NotificationPublisher;

public class GCMIntentService extends IntentService {
	public GCMIntentService() {
		super("GCMIntentService");
	}

	@Override
	protected void onHandleIntent(Intent intent) {
                NotificationPublisher publisher = new NotificationPublisher(this);
                publisher.publishGCM(intent.getExtras());
        }
}
