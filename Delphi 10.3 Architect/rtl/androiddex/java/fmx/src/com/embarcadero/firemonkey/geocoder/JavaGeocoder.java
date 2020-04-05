package com.embarcadero.firemonkey.geocoder;

import android.content.Context;
import android.location.Geocoder;

public class JavaGeocoder {
	public Geocoder InstanceOfGeocoder;
	
	public JavaGeocoder(Context Con){
		super();
		InstanceOfGeocoder = new Geocoder(Con);
	}

}
