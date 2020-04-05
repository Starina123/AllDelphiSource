package android.bluetooth;

public interface RTLBluetoothGattListener {

	public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic);

	public void onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status);

	public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status);

	public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState);

	public void onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status);

	public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status);

	public void onReadRemoteRssi(BluetoothGatt gatt, int rssi, int status);

	public void onReliableWriteCompleted(BluetoothGatt gatt, int status);

	public void onServicesDiscovered(BluetoothGatt gatt, int status);

}
