package com.embarcadero.rtl.notifications;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.media.RingtoneManager;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.util.Log;

import com.embarcadero.firemonkey.FMXNativeActivity;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Objects;

/**
 * Copyright(c) 2013-2015 Embarcadero Technologies, Inc.
 */
public class NotificationPublisher {

    private static final String TAG = "PushNotification";

    public static final String ACTION_GCM_NOTIFICATION = "GCMNotification";
    private static int GCM_ID = 1;

    @NonNull
    private final Context context;

    public NotificationPublisher(@NonNull Context context) {
        this.context = Objects.requireNonNull(context, "context");
    }

    public void publishGCM(@Nullable Bundle extras) {
        // https://firebase.google.com/docs/cloud-messaging/http-server-ref#notification-payload-support
        // Different kinds of push message:
        // {
        //    "to": <MyDeviceID>",
        //    "notification": {
        //        "body": "It finally works!!!!!",
        //        "title": "CODY Mobility Title",
        //        "priority": "high",
        //        "content_available": false,
        //        "dry_run": false
        //    }
        // }
        // -------------------------------------------
        // {
        //    "to": "<MyDeviceID>",
        //    "data": {
        //        "message": "It finally works!!!!!",
        //        "title": "CODY Mobility Title",
        //        "priority": "high",
        //        "content_available": false,
        //        "dry_run": false
        //    }
        // }
        String title;
        String message;
        if (extras != null) {
            title = searchTitleInBundle(extras);
            message = searchMessageInBundle(extras);
        } else {
            title = "";
            message = "";
        }
        publishGCM(title.isEmpty() ? getDefaultTitle() : title, message, extras);
    }

    /**
     * Searches title in bundle data.
     *
     * @param extras push notification payload.
     * @return title. If title is not found, returns empty string.
     */
    @NonNull
    private String searchTitleInBundle(@NonNull Bundle extras) {
        Objects.requireNonNull(extras, "extras");

        String title;
        // We prefer the title of the notification from special payload "notification"
        Object notificationData = extras.get("notification");
        if (notificationData != null && isJson(notificationData)) {
            title = getFieldValueFromJsonObject(notificationData, "title");
        } else {
            title = "";
        }

        if (!title.isEmpty()) {
            return title;
        }

        // After we are searching possible title from data payload "data"
        Object payloadData = extras.get("data");
        if (payloadData != null && isJson(payloadData)) {
            title = getFieldValueFromJsonObject(payloadData, "title");
        }

        if (!title.isEmpty()) {
            return title;
        }

        // And finally we are looking for title in the bundle.
        title = extras.getString("gcm.notification.title");
        if (title == null || title.isEmpty()) {
            title = extras.getString("data.title");
        }
        if (title == null || title.isEmpty()) {
            title = extras.getString("title");
        }
        return title == null ? "" : title;
    }

    /**
     * Returns default notification title as the application name.
     */
    @NonNull
    private String getDefaultTitle() {
        Context applicationContext = context.getApplicationContext();
        return applicationContext.getPackageManager().getApplicationLabel(applicationContext.getApplicationInfo()).toString();
    }

    /**
     * Returns json field value by {@code fieldName}
     *
     * @param notificationData json object
     * @param fieldName        json field name
     * @return value of specified field name. If field is not found, returns empty string.
     */
    @NonNull
    private String getFieldValueFromJsonObject(@NonNull Object notificationData, @NonNull String fieldName) {
        Objects.requireNonNull(notificationData, "notificationData");

        JSONObject jsonObject;
        try {
            jsonObject = new JSONObject(notificationData.toString());
            return jsonObject.optString(fieldName);
        } catch (JSONException e) {
            Log.w(TAG, "Cannot extract specified field value [" + fieldName + "]");
            return "";
        }
    }

    private static boolean isJson(@NonNull Object data) {
        Objects.requireNonNull(data, "data");

        String string = data.toString();
        return string.startsWith("{") && string.endsWith("}");
    }

    /**
     * Searches message in bundle data.
     *
     * @param extras push notification payload.
     * @return message. If message is not found, returns empty string.
     */
    @NonNull
    private String searchMessageInBundle(@Nullable Bundle extras) {
        Objects.requireNonNull(extras, "extras");

        String message;
        // We prefer the message of the notification from special payload "notification"
        Object notificationData = extras.get("notification");
        if (notificationData != null && isJson(notificationData)) {
            message = getFieldValueFromJsonObject(notificationData, "body");
        } else {
            message = "";
        }

        if (!message.isEmpty()) {
            return message;
        }

        // After we are searching possible message from data payload "data"
        Object payloadData = extras.get("data");
        if (payloadData != null && isJson(payloadData)) {
            message = getFieldValueFromJsonObject(payloadData, "message");
            if (message.isEmpty()) {
                message = getFieldValueFromJsonObject(payloadData, "msg");
            }
            if (message.isEmpty()) {
                message = getFieldValueFromJsonObject(payloadData, "alert");
            }
            if (message.isEmpty()) {
                message = getFieldValueFromJsonObject(payloadData, "body");
            }
        }

        if (!message.isEmpty()) {
            return message;
        }

        // And finally we are looking for body text in the bundle.
        message = extras.getString("gcm.notification.body");
        if (message == null || message.isEmpty()) {
            message = extras.getString("gcm.data.message");
        }
        if (message == null || message.isEmpty()) {
            message = extras.getString("gcm.data.msg");
        }
        if (message == null || message.isEmpty()) {
            message = extras.getString("gcm.data.alert");
        }
        if (message == null || message.isEmpty()) {
            message = extras.getString("gcm.data.body");
        }
        if (message == null || message.isEmpty()) {
            message = extras.getString("message");
        }
        if (message == null || message.isEmpty()) {
            message = extras.getString("msg");
        }
        if (message == null || message.isEmpty()) {
            message = extras.getString("alert");
        }
        if (message == null || message.isEmpty()) {
            message = extras.getString("body");
        }

        return message == null ? "" : message;
    }

    /**
     * Shows local notification message in the Notification Center.
     *
     * @param title     notification message title
     * @param bodyText  text of notification body
     * @param gcmExtras extras from push notification
     */
    private void publishGCM(@NonNull String title, @NonNull String bodyText, @Nullable Bundle gcmExtras) {
        Objects.requireNonNull(title, "title");
        Objects.requireNonNull(bodyText, "bodyText");

        Intent newIntent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (newIntent == null) {
            newIntent = new Intent(context, FMXNativeActivity.class);
        }
        newIntent.setAction(ACTION_GCM_NOTIFICATION)
                 .setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_CLEAR_TOP)
                 .putExtra("gcm", gcmExtras == null ? new Bundle() : gcmExtras);

        // Make each intent unique
        PendingIntent contentIntent = PendingIntent.getActivity(context, GCM_ID++,
                newIntent,
                PendingIntent.FLAG_UPDATE_CURRENT);   // updates the pending intent's extras

        String channelId = gcmExtras == null ? null : gcmExtras.getString("gcm.notification.android_channel_id");
        // Make each notification unique
        Notification notification = buildNotification(title, bodyText, contentIntent, channelId);
        getNotificationManagerOrThrow().notify(GCM_ID++, notification);
    }

    @NonNull
    private NotificationManager getNotificationManagerOrThrow() {
        NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (notificationManager == null) {
            throw new IllegalStateException("Cannot get system service [NOTIFICATION_SERVICE]");
        }
        return notificationManager;
    }

    /**
     * Creates LocalNotification object.
     *
     * @param title         notification title
     * @param bodyText      notification body Text
     * @param contentIntent PendingIntent to send when the notification is clicked
     * @param channelId     id of notification channel
     * @return notification instance
     */
    @SuppressWarnings("deprecation")
    @NonNull
    private Notification buildNotification(String title, String bodyText, PendingIntent contentIntent, @Nullable String channelId) {
        int icon = context.getResources().getIdentifier("drawable/ic_notification", null, context.getPackageName());
        if (icon == 0) {
            icon = context.getApplicationInfo().icon;
        }

        Notification.Builder builder = new Notification.Builder(context)
                .setSmallIcon(icon)
                .setTicker(title)
                .setContentTitle(title)
                .setContentText(bodyText)
                .setContentIntent(contentIntent)
                .setStyle(new Notification.BigTextStyle().bigText(bodyText))
                .setSound(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION));
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
        return builder.build();
    }
}