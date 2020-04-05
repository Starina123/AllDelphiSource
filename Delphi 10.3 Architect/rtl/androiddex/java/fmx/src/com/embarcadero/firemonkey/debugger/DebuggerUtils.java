package com.embarcadero.firemonkey.debugger;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

/**
 * Utils for working with gdb debugger for FMX.
 */
public class DebuggerUtils {

    private static final String TAG = "FMXDebugger";
    private static final int BUFFER_SIZE = 1024;

    private final Activity activity;

    public DebuggerUtils(Activity activity) {
        this.activity = activity;
    }

    public void tryStartDebugger() {
        int portno = -1;

        Intent aIntent = activity.getIntent();
        if (aIntent != null) {
            Bundle aExtra = aIntent.getExtras();
            if (aExtra != null) {
                portno = aExtra.getInt("port", -1);
            }
        }
        if (portno == 0)
            portno = findAvailablePort();
        if (portno > 0)
            startGdbServer(portno);
    }

    private int invokeGdbServer(String gdbServerName, int port) {
        int pid = getPid(gdbServerName);
        if (pid != -1) {
            android.os.Process.killProcess(pid);
        }
        pid = -1;
        try {
            if (new File(gdbServerName).canExecute()) {
                Process process = new ProcessBuilder()
                        .command(gdbServerName, "tcp:" + String.valueOf(port),
                                "--attach", "" + android.os.Process.myPid()).redirectErrorStream(true).start();
                pid = getPid(gdbServerName);
            }
        } catch (Exception e) {
            Log.w(TAG, "Exception failed to start " + gdbServerName);
            pid = -1;
        }
        return pid;
    }

    private void startGdbServer(int portno) {
        @SuppressWarnings("unused")

        String libGdbServerPath = activity.getFilesDir().getParent() + "/lib/gdbserver";

        if (invokeGdbServer(libGdbServerPath, portno) == -1) {
            // Try cache/gdbserver
            File cacheGdbserver = new File(activity.getFilesDir().getParent() + "/cache/gdbserver");
            if (!cacheGdbserver.exists()) {
                try {
                    // Copy the gdbserver from data to cache
                    // mkdir cache
                    File cacheDir = cacheGdbserver.getParentFile();
                    if (!cacheDir.exists()) {
                        cacheDir.mkdir();
                    }

                    // cp lib/gdbserver cache/'
                    InputStream src = new FileInputStream( new File(libGdbServerPath) );
                    OutputStream dst = new FileOutputStream(cacheGdbserver);
                    byte[] buf = new byte[BUFFER_SIZE];
                    int len;
                    while ((len = src.read(buf)) > 0) {
                        dst.write(buf, 0, len);
                    }
                    src.close();
                    dst.close();

                    // chmod 755 cache/gdbserver'
                    cacheGdbserver.setExecutable(true, false);
                    cacheGdbserver.setReadable(true, false);
                } catch (Exception e) {
                    Log.w(TAG, "Exception failed to copy gdbserver");
                }
            }
            invokeGdbServer(cacheGdbserver.getPath(), portno);
        }
    }

    private int findAvailablePort() {
        return -1; // not implemented yet.
    }

    private int getPid(String processName) {
        int pid = -1;

        try {
            Process process = new ProcessBuilder().command("ps").start();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            try {
                String line;

                processName = processName.toLowerCase();
                while ((line = bufferedReader.readLine()) != null) {
                    if (line.toLowerCase().contains(processName)) {
                        String [] columns = line.split("[ ]+");
                        pid = Integer.parseInt(columns[1]);
                        break;
                    }
                }
            }
            finally {
                bufferedReader.close();
            }
        } catch (Exception e) {
            Log.w(TAG, "Exception failed to start ps command: " + e.getMessage());
        }
        return pid;
    }
}
