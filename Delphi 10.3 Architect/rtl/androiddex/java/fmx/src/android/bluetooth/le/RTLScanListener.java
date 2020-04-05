package android.bluetooth.le;

import java.util.List;

public interface RTLScanListener {    
    public void onBatchScanResults(List results);
    public void onScanFailed(int errorCode);
    public void onScanResult(int callbackType, ScanResult result);
}
	