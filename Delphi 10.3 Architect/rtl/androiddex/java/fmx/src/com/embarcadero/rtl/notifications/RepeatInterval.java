/**
 * {*******************************************************}
 * {                                                       }
 * {            Delphi RTL Notification Service            }
 * {                                                       }
 * {   Repeat Interval Types for repeatable Notification   }
 * {                                                       }
 * { Copyright(c) 2013-2015 Embarcadero Technologies, Inc. }
 * {                                                       }
 * {*******************************************************}
 */
package com.embarcadero.rtl.notifications;

import java.util.Calendar;

public class RepeatInterval {

    public static final int REPEAT_INTERVAL_NONE = 0;
    public static final int REPEAT_INTERVAL_SECOND = 1;
    public static final int REPEAT_INTERVAL_MINUTE = 2;
    public static final int REPEAT_INTERVAL_HOUR = 3;
    public static final int REPEAT_INTERVAL_DAY = 4;
    public static final int REPEAT_INTERVAL_WEEK = 5;
    public static final int REPEAT_INTERVAL_WEEKDAYS = 6;
    public static final int REPEAT_INTERVAL_MONTH = 7;
    public static final int REPEAT_INTERVAL_QUAERTER = 8;
    public static final int REPEAT_INTERVAL_YEAR = 9;
    public static final int REPEAT_INTERVAL_ERA = 10;

    public static long getRepeatIntervalMSsec(int repeatIntervalType) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        switch (repeatIntervalType) {
            case REPEAT_INTERVAL_SECOND: {
                calendar.add(Calendar.SECOND, 1);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_MINUTE: {
                calendar.add(Calendar.MINUTE, 1);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_HOUR: {
                calendar.add(Calendar.HOUR, 1);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_DAY: {
                calendar.add(Calendar.DATE, 1);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_WEEK: {
                calendar.add(Calendar.DATE, 7);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_WEEKDAYS: {
                return 0;
            }
            case REPEAT_INTERVAL_MONTH: {
                calendar.add(Calendar.MONTH, 1);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_QUAERTER: {
                calendar.add(Calendar.MONTH, 3);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_YEAR: {
                calendar.add(Calendar.YEAR, 1);
                return calendar.getTimeInMillis();
            }
            case REPEAT_INTERVAL_ERA: {
                calendar.add(Calendar.ERA, 1);
                return calendar.getTimeInMillis();
            }
            default:
                return 0;
        }
    }
}
