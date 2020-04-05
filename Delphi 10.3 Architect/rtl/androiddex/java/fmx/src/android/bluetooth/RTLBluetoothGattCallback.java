package android.bluetooth;

import android.annotation.SuppressLint;

@SuppressLint("NewApi")
public class RTLBluetoothGattCallback extends BluetoothGattCallback {
	
	private RTLBluetoothGattListener mListener;
	
	public RTLBluetoothGattCallback(RTLBluetoothGattListener listener) {
		mListener = listener;
	}
	
	public void 	onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic){ 
		mListener.onCharacteristicChanged(gatt, characteristic);
	}
	public void 	onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status){ 
		mListener.onCharacteristicRead(gatt, characteristic, status);
	}
	public void 	onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status){ 
		mListener.onCharacteristicWrite(gatt, characteristic, status);
	}
	public void 	onConnectionStateChange(BluetoothGatt gatt, int status, int newState){ 
		mListener.onConnectionStateChange(gatt, status, newState);
	}
	public void 	onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status){ 
		mListener.onDescriptorRead(gatt, descriptor, status);
	}
	public void 	onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status){ 
		mListener.onDescriptorWrite(gatt, descriptor, status);
	}
	public void 	onReadRemoteRssi(BluetoothGatt gatt, int rssi, int status){ 
		mListener.onReadRemoteRssi(gatt, rssi, status);
	}
	public void 	onReliableWriteCompleted(BluetoothGatt gatt, int status){ 
		mListener.onReliableWriteCompleted(gatt, status);
	}
	public void 	onServicesDiscovered(BluetoothGatt gatt, int status){ 
		mListener.onServicesDiscovered(gatt, status);
	}
	
}
