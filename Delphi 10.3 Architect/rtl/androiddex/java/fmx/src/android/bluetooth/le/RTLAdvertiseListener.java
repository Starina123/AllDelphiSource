package android.bluetooth.le;

public interface RTLAdvertiseListener {    
	public void onStartFailure(int errorCode);    
	public void onStartSuccess(AdvertiseSettings settingsInEffect);
}
	