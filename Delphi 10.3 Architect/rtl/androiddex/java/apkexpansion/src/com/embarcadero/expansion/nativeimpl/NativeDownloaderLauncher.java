package com.embarcadero.expansion.nativeimpl;

import android.app.Activity;
import android.content.Context;

import com.embarcadero.expansion.ApkBaseDownloader;
import com.embarcadero.expansion.ApkDownloaderClient;
import com.embarcadero.expansion.ApkDownloaderListener;
import com.embarcadero.expansion.ApkDownloaderService;
import com.embarcadero.expansion.ApkFileInfo;
import com.google.android.vending.expansion.downloader.IDownloaderService;
import com.google.android.vending.expansion.downloader.IStub;

public class NativeDownloaderLauncher extends ApkBaseDownloader{
	
	private ApkDownloaderClient mDownloaderClient;

	public NativeDownloaderLauncher(String publicKey, byte[] salt, ApkFileInfo[] apks) {
		super(publicKey, salt, apks);
	}
	
	public boolean launch(Activity activity, ApkDownloaderListener listener){
		mDownloaderClient = new ApkDownloaderClient(activity, ApkDownloaderService.xAPKS, listener);
		return mDownloaderClient.launch();
	}
	
	public IDownloaderService getDownloaderService(){
		return (mDownloaderClient != null)
				? mDownloaderClient.getDownloaderService()
				: null;
	}
	
	public IStub getDownloaderClientStup(){
		return (mDownloaderClient != null)
				? mDownloaderClient.getDownloaderClientStub()
				: null;
	}
	
	// Proxy functions to make service requests
	
    public void requestAbortDownload(){
    	IDownloaderService service = getDownloaderService();
    	if(service != null) service.requestAbortDownload();
    }
   
    public void requestPauseDownload(){
    	IDownloaderService service = getDownloaderService();
    	if(service != null) service.requestPauseDownload();
    }
    
    public void requestContinueDownload(){
    	IDownloaderService service = getDownloaderService();
    	if(service != null) service.requestContinueDownload();
    }
    
    public void connect(Context c){
    	IStub stub = getDownloaderClientStup();
    	if(stub != null) stub.connect(c);
    }
    
    public void disconnect(Context c){
    	IStub stub = getDownloaderClientStup();
    	if(stub != null) stub.disconnect(c);
    }
    
    
}
