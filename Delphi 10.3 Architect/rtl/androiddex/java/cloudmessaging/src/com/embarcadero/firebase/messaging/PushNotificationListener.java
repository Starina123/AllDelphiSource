package com.embarcadero.firebase.messaging;

import android.os.Bundle;
import android.support.annotation.NonNull;

/**
 * Listener is designed to receive push events from FMX application.
 */
public interface PushNotificationListener {

    /**
     * Called when a push message is received.
     *
     * @param notification push notification data.
     */
    void onNotificationReceived(@NonNull Bundle notification);

    /**
     * Called when new FireBase device token was given.
     *
     * @param token new device token.
     */
    void onNewTokenReceived(@NonNull String token);
}
