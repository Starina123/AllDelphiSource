package com.embarcadero.rtl;

import android.os.Handler;
import android.os.Message;

public class RTLHandler
        extends Handler {
    public final RTLSuperHandler Super = new RTLSuperHandler(this);
    private Listener mListener;

    public RTLHandler(Listener paramListener) {
        mListener = paramListener;
    }

    private void superHandleMessage(Message paramMessage) {
        super.handleMessage(paramMessage);
    }

    public void handleMessage(Message paramMessage) {
        mListener.handleMessage(paramMessage);
    }

    public static abstract interface Listener {
        public abstract void handleMessage(Message paramMessage);
    }

    public class RTLSuperHandler {
        RTLHandler parent;

        public RTLSuperHandler(RTLHandler paramRTLHandler) {
            parent = paramRTLHandler;
        }

        public void handleMessage(Message paramMessage) {
            parent.superHandleMessage(paramMessage);
        }
    }
}
