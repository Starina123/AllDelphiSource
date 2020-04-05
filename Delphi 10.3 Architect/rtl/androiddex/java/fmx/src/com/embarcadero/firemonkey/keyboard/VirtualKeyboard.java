package com.embarcadero.firemonkey.keyboard;

import android.content.Context;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

import com.embarcadero.firemonkey.FMXNativeActivity;
import com.embarcadero.firemonkey.SystemServicesHelper;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Service for control Android Soft keyboard.
 */
@SuppressWarnings("unused")
public class VirtualKeyboard implements VirtualKeyboardFrameObserver.OnVirtualKeyboardFrameChangedListener {

    @NonNull
    private final FMXNativeActivity activity;

    @NonNull
    private final SyncResultReceiver receiver;

    @NonNull
    private final List<OnKeyboardStateChangedListener> listeners;

    @NonNull
    private final VirtualKeyboardFrameObserver virtualKeyboardFrameObserver;

    public VirtualKeyboard(@NonNull FMXNativeActivity activity) {
        this.activity = Objects.requireNonNull(activity, "activity");
        this.receiver = new SyncResultReceiver();
        this.listeners = new ArrayList<OnKeyboardStateChangedListener>();
        this.virtualKeyboardFrameObserver = new VirtualKeyboardFrameObserver(activity);
        this.virtualKeyboardFrameObserver.setListener(this);
    }

    /**
     * Shows virtual keyboard for specified view.
     */
    @SuppressWarnings("UnusedReturnValue")
    public boolean showFor(View view) {
        InputMethodManager imm = getInputMethodManager();
        return imm.showSoftInput(view, 0, receiver);
    }

    /**
     * Hide virtual keyboard.
     */
    public boolean hide() {
        View currentFocus = activity.getCurrentFocus();
        return hide(currentFocus == null ? activity.getViewGroup() : currentFocus);
    }

    /**
     * Hide virtual keyboard for specified view.
     */
    public boolean hide(@NonNull View view) {
        Objects.requireNonNull(view, "view");

        InputMethodManager imm = getInputMethodManager();
        boolean result = imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
        receiver.onReceiveResult(InputMethodManager.RESULT_HIDDEN, null);
        return result;
    }

    /**
     * Defines is virtual keyboard visible or not.
     */
    public boolean isVirtualKeyboardShown() {
        return virtualKeyboardFrameObserver.isVirtualKeyboardShown();
    }

    /**
     * Adds listener for observing changes states of Virtual Keyboard.
     */
    public void addOnKeyboardStateChangedListener(@NonNull OnKeyboardStateChangedListener listener) {
        Objects.requireNonNull(listener, "listener");

        if (!listeners.contains(listener)) {
            listeners.add(listener);
        }
    }

    /**
     * Removes the previously registered listener for observing changes states of Virtual Keyboard.
     */
    public void removeOnKeyboardStateChangedListener(@NonNull OnKeyboardStateChangedListener listener) {
        listeners.remove(listener);
    }

    @NonNull
    public VirtualKeyboardFrameObserver getVirtualKeyboardFrameObserver() {
        return virtualKeyboardFrameObserver;
    }

    @NonNull
    private InputMethodManager getInputMethodManager() {
        return SystemServicesHelper.getServiceOrThrow(activity, Context.INPUT_METHOD_SERVICE, InputMethodManager.class);
    }

    @Override
    public void onVirtualKeyboardFrameChanged(@NonNull Rect newFrame) {
        for (OnKeyboardStateChangedListener listener : listeners) {
            listener.onVirtualKeyboardFrameChanged(newFrame);
        }
    }

    private class SyncResultReceiver extends ResultReceiver {

        SyncResultReceiver() {
            super(null);
        }

        @Override
        public void onReceiveResult(int result, Bundle data) {
            switch (result) {
                case InputMethodManager.RESULT_SHOWN:
                    for (OnKeyboardStateChangedListener listener : listeners) {
                        listener.onVirtualKeyboardWillShown();
                    }
                    break;

                case InputMethodManager.RESULT_HIDDEN:
                    for (OnKeyboardStateChangedListener listener : listeners) {
                        listener.onVirtualKeyboardWillHidden();
                    }
                    break;
            }
        }
    }
}
