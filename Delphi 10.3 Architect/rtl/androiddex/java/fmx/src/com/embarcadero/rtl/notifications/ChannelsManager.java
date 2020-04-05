package com.embarcadero.rtl.notifications;

import android.annotation.TargetApi;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Build;
import android.support.annotation.NonNull;

import com.embarcadero.firemonkey.SystemServicesHelper;

import java.util.List;
import java.util.Objects;

/**
 * Manager of Notification Channels. Responsible for working with default channel and channels in general.
 *
 * Copyright(c) 2018 Embarcadero Technologies, Inc.
 */
public class ChannelsManager {

    private static final String DEFAULT_CHANNEL_ID = "default";

    @NonNull
    private final Context context;

    public ChannelsManager(@NonNull Context context) {
        this.context = Objects.requireNonNull(context, "context");
    }

    /**
     * Returns default channel id for all notification without specified channel.
     */
    @NonNull
    public String getDefaultChannelId() {
        if (!hasDefaultChannel()) {
            createDefaultChannel();
        }

        return DEFAULT_CHANNEL_ID;
    }

    /**
     * Returns whether the application has a default channel or not.
     */
    private boolean hasDefaultChannel() {
        NotificationManager notificationManager = SystemServicesHelper.getServiceOrThrow(context,
                                                                                         Context.NOTIFICATION_SERVICE,
                                                                                         NotificationManager.class);
        if (Build.VERSION.SDK_INT >= 26) {
            List<NotificationChannel> channels = notificationManager.getNotificationChannels();
            return hasDefaultChannel(channels);
        } else {
            return true;
        }
    }

    /**
     * Creates default channel for notifications without specified channel Id.
     */
    @TargetApi(26)
    private void createDefaultChannel() {
        NotificationManager notificationManager = SystemServicesHelper.getServiceOrThrow(context,
                                                                                         Context.NOTIFICATION_SERVICE,
                                                                                         NotificationManager.class);
        NotificationChannel channel = new NotificationChannel(DEFAULT_CHANNEL_ID, "Default",
                                                              NotificationManager.IMPORTANCE_DEFAULT);
        notificationManager.createNotificationChannel(channel);
    }

    @TargetApi(26)
    private static boolean hasDefaultChannel(@NonNull List<NotificationChannel> channels) {
        for (NotificationChannel channel : channels) {
            if (Objects.equals(channel.getId(), DEFAULT_CHANNEL_ID)) {
                return true;
            }
        }
        return false;
    }
}
