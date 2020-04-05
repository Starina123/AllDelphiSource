package com.embarcadero.rtl.notifications;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.util.Log;

import java.io.File;
import java.util.Objects;

/**
 * Copyright(c) 2013-2015 Embarcadero Technologies, Inc.
 */
public class NotificationInfo {

    public static final String ACTION_NOTIFICATION = "ACTION_NOTIFICATION";
    public static final String EXTRA_ACTIVITY_CLASS_NAME = "EXTRA_ACTIVITY_CLASS_NAME";
    public static final String EXTRA_ALERT_ACTION = "EXTRA_ALERT_ACTION";
    public static final String EXTRA_ALERT_BODY = "EXTRA_ALERT_BODY";
    public static final String EXTRA_NAME = "EXTRA_NAME";
    public static final String EXTRA_NUMBER = "EXTRA_NUMBER";
    public static final String EXTRA_ENABLE_SOUND = "EXTRA_ENABLE_SOUND";
    public static final String EXTRA_SOUND_NAME = "EXTRA_SOUND_NAME";
    @SuppressWarnings("unused")
    public static final String EXTRA_FIRE_DATE = "EXTRA_FIRE_DATE";
    public static final String EXTRA_FIRE_GMT_DATE = "EXTRA_FIRE_GMT_DATE";
    public static final String EXTRA_REPEAT_INTERVAL = "EXTRA_REPEAT_INTERVAL";
    public static final String EXTRA_HAS_ACTION = "EXTRA_HAS_ACTION";
    public static final String EXTRA_UNIQUE_ID = "EXTRA_UNIQUE_ID";
    public static final String EXTRA_TITLE = "EXTRA_TITLE";
    public static final String EXTRA_CHANNEL_ID = "EXTRA_CHANNEL_ID";

    @NonNull
    private final Context context;
    @NonNull
    private final Intent intent;

    /**
     * The class of activity that will be opened by clicking on the notification in the notification center panel.
     */
    @NonNull
    private final Class<?> activityClass;

    /**
     * Unique identification of notification. Used only for scheduled notifications.
     */
    private final int intentCode;

    /**
     * Unique string name of scheduled notification. Used to make changes to the deferred notification settings.
     */
    @Nullable
    private final String name;

    /**
     * Notification title.
     */
    @NonNull
    private final CharSequence title;

    /**
     * Notification message.
     */
    @Nullable
    private final String alertBody;

    /**
     * UTC time, when notification must be shown.
     */
    private final long fireDate;

    /**
     * The interval at which the notification should be re-displayed.
     */
    private final int repeatInterval;

    /**
     * The number of events that this notification represents.
     */
    private final int notifyNumber;

    /**
     * Should the Android play a sound when a notification appears.
     */
    private final boolean enableSound;

    /**
     * URI of file with sound.
     */
    @Nullable
    private final String soundName;

    /**
     * Should the Android shows action button with title {@link #alertAction}.
     */
    private final boolean hasAction;

    /**
     * Title of action button.
     */
    @Nullable
    private final String alertAction;

    /**
     * Resource id of icon, which will be shown on notification.
     */
    private final int appIcon;

    /**
     * ID of notification channel.
     */
    @Nullable
    private final String channelId;

    NotificationInfo(@NonNull Context context, @NonNull Intent intent) throws ClassNotFoundException {
        this.intent = Objects.requireNonNull(intent, "intent");
        this.context = Objects.requireNonNull(context, "context");
        String className = intent.getStringExtra(EXTRA_ACTIVITY_CLASS_NAME);
        this.activityClass = Class.forName(className);
        this.intentCode = intent.getIntExtra(EXTRA_UNIQUE_ID, -1);
        this.name = intent.getStringExtra(EXTRA_NAME);
        this.title = intent.getStringExtra(EXTRA_TITLE);
        this.alertBody = intent.getStringExtra(EXTRA_ALERT_BODY);
        this.alertAction = intent.getStringExtra(EXTRA_ALERT_ACTION);
        this.notifyNumber = intent.getIntExtra(EXTRA_NUMBER, 0);
        this.enableSound = intent.getBooleanExtra(EXTRA_ENABLE_SOUND, true);
        this.soundName = intent.getStringExtra(EXTRA_SOUND_NAME);
        // In XE8 We don't support actions feature.
        // mHasAction = intent.getBooleanExtra(EXTRA_HAS_ACTION, true);
        this.hasAction = false;
        this.fireDate = intent.getLongExtra(EXTRA_FIRE_GMT_DATE, System.currentTimeMillis());
        this.repeatInterval = intent.getIntExtra(EXTRA_REPEAT_INTERVAL, 0);

        int icon = context.getResources().getIdentifier("drawable/ic_notification", null, context.getPackageName());
        if (icon == 0) {
            icon = context.getApplicationInfo().icon;
        }
        this.appIcon = icon;
        this.channelId = intent.getStringExtra(EXTRA_CHANNEL_ID);
    }

    @NonNull
    Notification createNotification() {
        Notification.Builder builder = new Notification.Builder(context);
        builder.setDefaults(Notification.DEFAULT_LIGHTS)
                .setSmallIcon(appIcon)
                .setTicker(title)
                .setContentTitle(title)
                .setContentText(alertBody)
                .setNumber(notifyNumber)
                .setContentIntent(getContentIntent(intentCode))
                .setAutoCancel(true);
        if (android.os.Build.VERSION.SDK_INT >= 21) {
            int accentColorResId = context.getResources().getIdentifier("color/notification_accent_color", null, context.getPackageName());
            if (accentColorResId != 0) {
                try {
                    int accentColor = ContextCompat.getColor(context, accentColorResId);
                    builder.setColor(accentColor);
                } catch (Resources.NotFoundException e) {
                    Log.d("NOTIFICATION", "Cannot set accent color, because color is not specified in the colors.xml. "+ e);
                }
            }
        }
        if (Build.VERSION.SDK_INT >= 26) {
            if (channelId == null || channelId.isEmpty()) {
                ChannelsManager channelsManager = new ChannelsManager(context);
                builder.setChannelId(channelsManager.getDefaultChannelId());
            } else {
                builder.setChannelId(channelId);
            }
        }

        if (hasAction) {
            builder.addAction(android.R.drawable.ic_menu_close_clear_cancel, alertAction, getActionIntent(1));
            builder.addAction(android.R.drawable.ic_menu_view, "Cancel", getActionIntent(2));
        }
        if (enableSound) {
            if ((soundName == null) || soundName.isEmpty()) {
                builder.setSound(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION));
            } else {
                builder.setSound(Uri.fromFile(new File(soundName)));
            }
        }

        return builder.build();
    }

    @NonNull
    public String getNotificationPreferencesValue() {
        return String.format("%s=%s", name, intentCode);
    }

    public int getRepeatInterval() {
        return repeatInterval;
    }

    public int getIntentCode() {
        return intentCode;
    }

    @Nullable
    public String getName() {
        return name;
    }

    @NonNull
    private PendingIntent getContentIntent(int code) {
        Intent intent = new Intent(this.intent);
        intent.setAction(ACTION_NOTIFICATION);
        intent.setClass(context, activityClass);
        intent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        return PendingIntent.getActivity(context, code, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    }

    @NonNull
    private PendingIntent getActionIntent(int code) {
        Intent intent = new Intent(context, activityClass);
        return PendingIntent.getBroadcast(context, code, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    }

    @Override
    public String toString() {
        return "name=" + name + ", intentCode=" + intentCode + ", title=" + title + ", alertBody=" + alertBody
                + ", alertAction=" + alertAction + ", fireDate=" + fireDate + ", repeatInterval=" + repeatInterval
                + ", notifyNumber=" + notifyNumber + ", enableSound=" + enableSound + ", soundName=" + soundName
                + ", hasAction=" + hasAction + ", appIcon=" + appIcon + ", channelId=" + channelId;
    }
}