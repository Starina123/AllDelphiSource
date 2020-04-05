package android.bluetooth.le;

import android.annotation.SuppressLint;
import java.util.List;

@SuppressLint("NewApi")
public class RTLScanCallback extends ScanCallback {

	private	RTLScanListener mListener;
	
	public RTLScanCallback(RTLScanListener listener) {
		mListener = listener;
	}
    public void onBatchScanResults(List results){
		mListener.onBatchScanResults(results);	
	}
    public void onScanFailed(int errorCode){
		mListener.onScanFailed(errorCode);	
	}
    public void onScanResult(int callbackType, ScanResult result){
		mListener.onScanResult(callbackType, result);	
	}	
}

















