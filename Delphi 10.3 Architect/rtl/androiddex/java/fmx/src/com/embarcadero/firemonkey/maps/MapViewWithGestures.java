package com.embarcadero.firemonkey.maps;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;

import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;

public class MapViewWithGestures extends MapView {
	private GestureDetector mDetector;

	public MapViewWithGestures(Context context, GoogleMapOptions options) {
		super(context, options);
		mDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener(), getHandler());
	}
	
	public GestureDetector getGestureDetector() {
		return mDetector;
	}
	
	@Override 
	public boolean dispatchTouchEvent(MotionEvent ev) {
		return mDetector.onTouchEvent(ev) || super.dispatchTouchEvent(ev);
	}

}
