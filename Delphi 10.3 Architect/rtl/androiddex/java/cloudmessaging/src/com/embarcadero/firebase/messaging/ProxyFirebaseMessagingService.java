package com.embarcadero.firebase.messaging;


import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.Log;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

/**
 * This service is designed to receive push messages from the server.
 */
public class ProxyFirebaseMessagingService extends FirebaseMessagingService {

    public static boolean DEBUG = false;

    @Nullable
    private static PushNotificationListener listener;

    /**
     * Sets global listener, which is used for passing push notification from FireBase service to FMX application.
     */
    @SuppressWarnings("unused")
    public static void setListener(@Nullable PushNotificationListener listener) {
        ProxyFirebaseMessagingService.listener = listener;
    }

    @Override
    public void onMessageReceived(RemoteMessage message) {
        Intent intent = message.toIntent();
        if (ProxyFirebaseMessagingService.listener != null) {
            Bundle extras = intent.getExtras() == null ? new Bundle() : intent.getExtras();
            ProxyFirebaseMessagingService.listener.onNotificationReceived(extras);
        }
        if (DEBUG) {
            Log.d("FIREBASE", "data=" + message.getData() + ", notification" + message.getNotification() + ", extras=" + intent.getExtras());
        }
    }

    @Override
    public void onNewToken(String token) {
        if (listener != null) {
            listener.onNewTokenReceived(token);
        }
        if (DEBUG) {
            Log.d("FIREBASE", "New token is received: token=" + token);
        }
    }
}