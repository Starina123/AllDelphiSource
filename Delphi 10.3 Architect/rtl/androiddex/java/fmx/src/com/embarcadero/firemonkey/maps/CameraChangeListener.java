package com.embarcadero.firemonkey.maps;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.CameraPosition;

public class CameraChangeListener implements GoogleMap.OnCameraChangeListener {
	public interface Callback {
		public void onCameraChange(CameraChangeListener listener);
	}
	
	private CameraPosition mPosition;
	private Callback mCallback;
	
	@Override
	public void onCameraChange(CameraPosition position) {
		mPosition = position;
		if (mCallback != null) {
			mCallback.onCameraChange(this);
		}
	}
	
	public void setCallback(Callback callback) {
		mCallback = callback;
	}
	
	public float getTilt() {
		return mPosition == null ? 0 : mPosition.tilt; 
	}
	
	public float getZoom() {
		return mPosition == null ? 0 : mPosition.zoom;
	}
	
	public float getBearing() {
		return mPosition == null ? 0 : mPosition.bearing;
	}
	
	public double getLatitude() {
		return mPosition == null ? 0 : mPosition.target.latitude;
	}
	
	public double getLongitude() {
		return mPosition == null ? 0 : mPosition.target.longitude;
	}

}
