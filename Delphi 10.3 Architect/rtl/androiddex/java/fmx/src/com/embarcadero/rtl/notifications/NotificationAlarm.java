package com.embarcadero.rtl.notifications;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.annotation.NonNull;
import android.util.Log;

import com.embarcadero.firemonkey.SystemServicesHelper;

import java.util.Objects;

/**
 * Class for presented delayed (scheduled) notification. It receives delayed android Alarm with full information about
 * scheduled notification and presents in Android Notification Center.
 * <p/>
 * Android doesn't provide scheduled notification. So we create our way for it:
 * <ol>
 * <li>We create Alarm with notification Intent (In Delphi side)</li>
 * <li>We store notification information in Alarm Intent</li>
 * <li>When time comes, This class receives intent from Android Alarm throw {@link NotificationAlarm#onReceive(Context, Intent)}</li>
 * <li>We restore notification information in {@link NotificationInfo#NotificationInfo(Context, Intent)}</li>
 * <li>We create native notification {@link NotificationInfo#createNotification()} and send
 * {@link NotificationAlarm#presentNotification(NotificationInfo)} it to Android Notification Center</li>
 * </ol>
 *
 * Copyright(c) 2013-2015 Embarcadero Technologies, Inc.
 */
public class NotificationAlarm extends BroadcastReceiver {

    private static final String TAG = "NotificationAlarm";
    public static final String NOTIFICATION_CENTER = "NOTIFICATION_EMBT_CENTER";
    public static final String SETTINGS_NOTIFICATION_IDS = "SETTINGS_NOTIFICATION_IDS";

    private Context context = null;

    @Override
    public void onReceive(@NonNull Context context, @NonNull Intent intent) {
        Objects.requireNonNull(intent, "intent");

        if (Objects.equals(intent.getAction(), NotificationInfo.ACTION_NOTIFICATION)) {
            this.context = Objects.requireNonNull(context, "context");

            try {
                NotificationInfo notificationInfo = new NotificationInfo(context, intent);
                presentNotification(notificationInfo);

                if (notificationInfo.getRepeatInterval() == RepeatInterval.REPEAT_INTERVAL_NONE) {
                    removeNotificationInfoFromSharedPreferences(notificationInfo);
                } else {
                    // Send repeatable notificationInfo to AlarmManager
                    rescheduleNotification(intent, notificationInfo);
                }
            } catch (Exception e) {
                Log.w(TAG, String.format("Cannot present scheduled notification. e=%s", e));
            } finally {
                this.context = null;
            }
        }
    }

    private void rescheduleNotification(@NonNull Intent intent, @NonNull NotificationInfo notificationInfo) {
        PendingIntent pendingIntent = PendingIntent.getBroadcast(context, notificationInfo.getIntentCode(),
                intent, PendingIntent.FLAG_UPDATE_CURRENT);

        AlarmManager alarmManager = SystemServicesHelper.getServiceOrThrow(context, Context.ALARM_SERVICE,
                                                                           AlarmManager.class);
        alarmManager.set(AlarmManager.RTC_WAKEUP,
                RepeatInterval.getRepeatIntervalMSsec(notificationInfo.getRepeatInterval()), pendingIntent);
    }

    private void presentNotification(@NonNull NotificationInfo notificationInfo) {
        Objects.requireNonNull(notificationInfo, "notificationInfo");

        Notification notification = notificationInfo.createNotification();
        NotificationManager notificationManager = SystemServicesHelper.getServiceOrThrow(context,
                Context.NOTIFICATION_SERVICE, NotificationManager.class);
        String notificationName = notificationInfo.getName();
        if (notificationName == null || notificationName.isEmpty()) {
            notificationManager.notify(notificationInfo.getIntentCode(), notification);
        } else {
            notificationManager.notify(notificationName, 0, notification);
        }
    }

    /**
     * We should remove delayed notification from external storage. Because delayed notification already displayed.
     * <p/>
     * External storage is used for saving list of scheduled notification, which is not displayed yet for possibility
     * cancel them in future. We has two different way for canceling notification:
     * <ol>
     * <li>Cancel of presented scheduled notification from Notification Center Service of Android</li>
     * <li>Cancel of not presented scheduled notification, which is not in notification center yet</li>
     * </ol>
     */
    private void removeNotificationInfoFromSharedPreferences(@NonNull NotificationInfo notificationInfo) {
        SharedPreferences preference = context.getSharedPreferences(NOTIFICATION_CENTER, Activity.MODE_PRIVATE);
        // Remove current notification from preferences
        String notificationsString = preference.getString(SETTINGS_NOTIFICATION_IDS, null);
        if (notificationsString != null) {
            String[] notifications = notificationsString.split(System.getProperty("line.separator"));
            StringBuilder sb = new StringBuilder();
            for (String notification : notifications) {
                if (!notification.equals(notificationInfo.getNotificationPreferencesValue()))
                    sb.append(notification);
            }
            // Replace notifications information
            Editor editor = preference.edit();
            try {
                editor.putString(SETTINGS_NOTIFICATION_IDS, sb.toString());
            } finally {
                editor.apply();
            }
        }
    }
}