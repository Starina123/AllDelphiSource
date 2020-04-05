package com.embarcadero.firemonkey.form;

import android.content.Context;
import android.view.MotionEvent;
import android.view.SurfaceView;

/**
 * View for FireMonkey form. FireMonkey uses this SurfaceView for painting form and catching main events like
 * a touching, size tracking.
 */
public class FormView extends SurfaceView {

    private FormViewListener listener;

    public FormView(Context context) {
        super(context);
    }

    /**
     * Sets listener, which allows to track events of touching, painting and sizing.
     *
     * @param listener listener
     */
    public void setListener(FormViewListener listener) {
        this.listener = listener;
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);

        if (hasListener()) {
            listener.onSizeChanged(w, h, oldw, oldh);
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        return hasListener() && listener.onTouchEvent(event);
    }

    private boolean hasListener() {
        return listener != null;
    }
}


