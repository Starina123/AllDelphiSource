package com.embarcadero.firemonkey;

import android.content.Intent;

public interface OnActivityListener {

    void onReceiveImagePath(int requestCode, String fileName);

    void onCancelReceiveImage(int requestCode);

    void onReceiveNotification(Intent intent);

    void onReceiveResult(int requestCode, int resultCode, Intent intent);

    void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults);
}