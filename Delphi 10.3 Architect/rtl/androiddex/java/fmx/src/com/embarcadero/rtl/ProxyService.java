//*******************************************************
//
//           CodeGear Delphi Runtime Library
// Copyright(c) 2014-2015 Embarcadero Technologies, Inc.
//
//*******************************************************

package com.embarcadero.rtl;

import android.content.Intent;
import android.os.IBinder;
import android.os.Binder;
import android.content.res.Configuration;
import android.os.Message;

public class ProxyService {

    static {
        System.loadLibrary("ProxyAndroidService");
    }

    static private native void onCreateNative(Object service, String libraryName);
    
    static private native void onDestroyNative(Object service, String libraryName);

    static private native int onStartCommandNative(Object service, String libraryName, Intent intent, int flags, int startId);

    static private native IBinder onBindNative(Object service, String libraryName, Intent intent);

    static private native boolean onUnbindNative(Object service, String libraryName, Intent intent);

    static private native void onRebindNative(Object service, String libraryName, Intent intent);

    static private native void onTaskRemovedNative(Object service, String libraryName, Intent rootIntent);

    static private native void onConfigurationChangedNative(Object service, String libraryName, Configuration newConfig);

    static private native void onLowMemoryNative(Object service, String libraryName);

    static private native void onTrimMemoryNative(Object service, String libraryName, int level);

    static private native long getDelphiService(Object service, String libraryName);

    static private native void onHandleIntentNative(Object service, String libraryName, Intent intent);

    static private native boolean onHandleMessageNative(Object service, String libraryName, Message msg);



    static public void onCreate(Object service, String libraryName) {
        onCreateNative(service, libraryName);
    }
    
    static public void onDestroy(Object service, String libraryName) {
        onDestroyNative(service, libraryName);
    }
    
    
    static public int onStartCommand(Object service, String libraryName, Intent intent, int flags, int startId) {
        return onStartCommandNative(service, libraryName, intent, flags, startId);
    }

    static public IBinder onBind(Object service, String libraryName, Intent intent) {
        return onBindNative(service, libraryName, intent);
    }

    static public void onRebind(Object service, String libraryName, Intent intent) {
        onRebindNative(service, libraryName, intent);
    }

    static public boolean onUnbind(Object service, String libraryName, Intent intent) {
        return onUnbindNative(service, libraryName, intent);
    }

    static public void onConfigurationChanged(Object service, String libraryName, Configuration newConfig) {
        onConfigurationChangedNative(service, libraryName, newConfig);
    }

    static public void onLowMemory(Object service, String libraryName) {
        onLowMemoryNative(service, libraryName);
    }

    static public void onTaskRemoved(Object service, String libraryName, Intent rootIntent) {
        onTaskRemovedNative(service, libraryName, rootIntent);
    }

    static public void onTrimMemory(Object service, String libraryName, int level) {
        onTrimMemoryNative(service, libraryName, level);
    }
    
    static public long getService(Object service, String libraryName) {
        return getDelphiService(service, libraryName);       
    }
    
        
    static public void onHandleIntent(Object service, String libraryName, Intent intent) {
        onHandleIntentNative(service, libraryName, intent);
    }

    static public boolean onHandleMessage(Object service, String libraryName, Message msg) {
        return onHandleMessageNative(service, libraryName, msg);
    }
    
}
