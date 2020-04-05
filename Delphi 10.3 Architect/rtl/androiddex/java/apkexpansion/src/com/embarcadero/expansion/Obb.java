package com.embarcadero.expansion;

import java.io.File;

import com.google.android.vending.expansion.downloader.Helpers;

import android.content.Context;
import android.os.storage.StorageManager;
import 	android.os.storage.OnObbStateChangeListener;

public class Obb extends OnObbStateChangeListener{
	
	public interface ObbListener {
		public void onObbStateChange(String path, int state);
	}
	
	private Context mContext;
	private ApkFileInfo mApkFile;
	private StorageManager mStorageManager;
	private ObbListener mListener;
	
	public Obb(Context c, ApkFileInfo a) {
		mContext = c;
		mApkFile = a;
		mStorageManager = (StorageManager) mContext.getSystemService(Context.STORAGE_SERVICE);
	}
	
	public void setListener(ObbListener listener){
		mListener = listener;
	}
	
	public void mount(){
		mStorageManager.mountObb(getPath(), mApkFile.mEncriptKey, this);
	}
	
	public void umount(boolean force){
		mStorageManager.unmountObb(getPath(), force, this);
	}
	
	public String getName(){
		return Helpers.getExpansionAPKFileName(mContext, mApkFile.mIsMain, mApkFile.mFileVersion);
	}
	
	public String getPath(){
		return Helpers.generateSaveFileName(mContext, getName());
	}
	
	public boolean isMounted(){
		return mStorageManager.isObbMounted(getPath());
	}
	
	public String getMountedObbPath() {
		return mStorageManager.getMountedObbPath(getPath());
	}
	
	public String getResourcePath(String filePath) {
		return getMountedObbPath() + File.separator + filePath;
	}
	
	@Override
	public void onObbStateChange(String path, int state){
		if (mListener != null)
			mListener.onObbStateChange(path, state);
	}
}