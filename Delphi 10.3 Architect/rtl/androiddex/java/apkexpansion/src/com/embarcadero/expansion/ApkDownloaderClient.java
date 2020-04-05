package com.embarcadero.expansion;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Messenger;
import android.util.Log;

import com.embarcadero.expansion.activityimpl.DownloaderActivity;
import com.google.android.vending.expansion.downloader.DownloadProgressInfo;
import com.google.android.vending.expansion.downloader.DownloaderClientMarshaller;
import com.google.android.vending.expansion.downloader.DownloaderServiceMarshaller;
import com.google.android.vending.expansion.downloader.IDownloaderClient;
import com.google.android.vending.expansion.downloader.IDownloaderService;
import com.google.android.vending.expansion.downloader.IStub;

public class ApkDownloaderClient implements IDownloaderClient  {
	
	private Activity mActivity;
    private IDownloaderService mRemoteService;
    private IStub mDownloaderClientStub;
	private ApkDownloaderListener mDownloaderListener;
	private ApkFileInfo[] mxAPKS;
    
    public ApkDownloaderClient(Activity activity, ApkFileInfo[] xAPKS, ApkDownloaderListener downloaderListener){
    	mActivity = activity;
    	mDownloaderListener = downloaderListener;
    	mxAPKS = xAPKS;
    }
    
    public boolean launch(){
    	if (!ApkFilesHelper.areExpansionFilesDelivered(mActivity, mxAPKS)) {
    		try {
                Intent launchIntent = mActivity.getIntent();
                Intent intentToLaunchActivityFromNotification = new Intent(mActivity, mActivity.getClass());
                intentToLaunchActivityFromNotification.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                intentToLaunchActivityFromNotification.setAction(launchIntent.getAction());

                if (launchIntent.getCategories() != null) {
                    for (String category : launchIntent.getCategories()) {
                        intentToLaunchActivityFromNotification.addCategory(category);
                    }
                }

                // Build PendingIntent used to open this activity from
                // Notification
                PendingIntent pendingIntent = PendingIntent.getActivity(mActivity, 0, intentToLaunchActivityFromNotification, PendingIntent.FLAG_UPDATE_CURRENT);
                int startResult = DownloaderClientMarshaller.startDownloadServiceIfRequired(mActivity, pendingIntent, ApkDownloaderService.class);

                if (startResult != DownloaderClientMarshaller.NO_DOWNLOAD_REQUIRED) {
                    mDownloaderClientStub = DownloaderClientMarshaller.CreateStub
                            ( this, ApkDownloaderService.class);
                    return true;
                }
                
            } catch (NameNotFoundException e) {
                e.printStackTrace();
            }
        }
    	return false;
    }

	@Override
	public void onServiceConnected(Messenger m) {
        mRemoteService = DownloaderServiceMarshaller.CreateProxy(m);
        mRemoteService.onClientUpdated(mDownloaderClientStub.getMessenger());
	}

	@Override
	public void onDownloadStateChanged(int newState) {
		mDownloaderListener.onDownloadStateChanged(newState);
	}

	@Override
	public void onDownloadProgress(DownloadProgressInfo progress) {
		mDownloaderListener.onDownloadProgress(progress);
	}
	
	public IDownloaderService getDownloaderService(){
		return mRemoteService;
	}
	
	public IStub getDownloaderClientStub(){
		return mDownloaderClientStub;
	}
}
