package com.embarcadero.firemonkey.camerapreview;

import java.io.IOException;
import android.content.Context;
import android.graphics.Canvas;
import android.hardware.Camera;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class CamPreview extends SurfaceView implements SurfaceHolder.Callback {

    private SurfaceHolder mHolder;
    public Camera mCamera;
    
    public CamPreview(Context context) {
        super(context);
       
        mHolder = getHolder();
        mHolder.addCallback(this);
        mHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
    }

    public void surfaceCreated(SurfaceHolder holder) {       
    	mCamera = Camera.open(1);
        try {
        	mCamera.setPreviewDisplay(holder);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

    public void surfaceDestroyed(SurfaceHolder holder) {
      
    	mCamera.stopPreview();
    	mCamera = null;
    }

    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
       
        Camera.Parameters parameters = mCamera.getParameters();
        parameters.setPreviewSize(w, h);
        mCamera.setParameters(parameters);
        mCamera.startPreview();
    }

    @Override
    public void draw(Canvas canvas) {
    		super.draw(canvas);
    }
}