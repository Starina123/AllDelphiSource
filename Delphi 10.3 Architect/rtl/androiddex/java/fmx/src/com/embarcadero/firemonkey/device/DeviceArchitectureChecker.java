package com.embarcadero.firemonkey.device;

import android.os.Build;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/**
 * Checks that the current device is compatible to use FireMonkey.
 */
public class DeviceArchitectureChecker {

    private static final String TAG = "FMXArchitectureChecker";

    /**
     * Checks the current characteristics of the device.
     *
     * @exception RuntimeException the characteristics are not compatible with FireMonkey
     */
    public static void check() {
        if (Build.CPU_ABI.equals("armeabi-v7a") && !hasNeon()) {
            Log.e(TAG, "Unsupported CPU architecture");
            throw new RuntimeException("Application does not support this device");
        }
    }

    private static boolean hasNeon() {
        File cpuInfo = new File("/proc/cpuinfo");
        if (cpuInfo.exists()) {
            try {
                BufferedReader reader = new BufferedReader(new FileReader(cpuInfo));
                String info;
                while ((info = reader.readLine()) != null) {
                    if (info.contains("Features")) {
                        if (info.contains("neon")) {
                            return true;
                        }
                        else {
                            Log.e(TAG, "NEON support is not detected in CPU Features");
                            return false;
                        }
                    }
                }
                reader.close();
            } catch (IOException ignored) {
            }
        }
        return false;
    }
}
