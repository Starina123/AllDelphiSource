package android.telephony;

import java.util.List;

public interface ICustomPhoneStateListener {
	public void onServiceStateChanged(ServiceState serviceState);
    public void onSignalStrengthChanged(int asu);
    public void onMessageWaitingIndicatorChanged(boolean mwi);
    public void onCallForwardingIndicatorChanged(boolean cfi);
    public void onCellLocationChanged(CellLocation location);
    public void onCallStateChanged(int state, String incomingNumber);
    public void onDataConnectionStateChanged(int state);
    public void onDataConnectionStateChanged(int state, int networkType);
    public void onDataActivity(int direction);
    public void onSignalStrengthsChanged(SignalStrength signalStrength);
    public void onCellInfoChanged(List<CellInfo> cellInfo);
}
