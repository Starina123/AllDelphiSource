package android.bluetooth;

public interface RTLBluetoothGattServerListener {
	public void 	onCharacteristicReadRequest(BluetoothDevice device, int requestId, int offset, BluetoothGattCharacteristic characteristic);
	public void 	onCharacteristicWriteRequest(BluetoothDevice device, int requestId, BluetoothGattCharacteristic characteristic, boolean preparedWrite, boolean responseNeeded, int offset, byte[] value);
	public void 	onConnectionStateChange(BluetoothDevice device, int status, int newState);
	public void 	onDescriptorReadRequest(BluetoothDevice device, int requestId, int offset, BluetoothGattDescriptor descriptor);
	public void 	onDescriptorWriteRequest(BluetoothDevice device, int requestId, BluetoothGattDescriptor descriptor, boolean preparedWrite, boolean responseNeeded, int offset, byte[] value);
	public void 	onExecuteWrite(BluetoothDevice device, int requestId, boolean execute);
	public void 	onServiceAdded(int status, BluetoothGattService service);
}
