package android.telephony;

import java.util.List;

public class CustomPhoneStateListener extends PhoneStateListener {
	
	ICustomPhoneStateListener mListener;
	
	public CustomPhoneStateListener(ICustomPhoneStateListener listener) {
		mListener = listener;
    }
    public void onServiceStateChanged(ServiceState serviceState) {
        mListener.onServiceStateChanged(serviceState);
    }
    @SuppressWarnings("deprecation")
    public void onSignalStrengthChanged(int asu) {
    	mListener.onSignalStrengthChanged(asu);
    }
    public void onMessageWaitingIndicatorChanged(boolean mwi) {
        mListener.onMessageWaitingIndicatorChanged(mwi);
    }
    public void onCallForwardingIndicatorChanged(boolean cfi) {
        mListener.onCallForwardingIndicatorChanged(cfi);
    }
    public void onCellLocationChanged(CellLocation location) {
        mListener.onCellLocationChanged(location);
    }
    public void onCallStateChanged(int state, String incomingNumber) {
        mListener.onCallStateChanged(state, incomingNumber);
    }
    public void onDataConnectionStateChanged(int state) {
    	mListener.onDataConnectionStateChanged(state);
    }
    public void onDataConnectionStateChanged(int state, int networkType) {
    	mListener.onDataConnectionStateChanged(state, networkType);
    }
    public void onDataActivity(int direction) {
    	mListener.onDataActivity(direction);
    }
    public void onSignalStrengthsChanged(SignalStrength signalStrength) {
    	mListener.onSignalStrengthsChanged(signalStrength);
    }
    public void onCellInfoChanged(List<CellInfo> cellInfo) {
    	mListener.onCellInfoChanged(cellInfo);
    }
}
