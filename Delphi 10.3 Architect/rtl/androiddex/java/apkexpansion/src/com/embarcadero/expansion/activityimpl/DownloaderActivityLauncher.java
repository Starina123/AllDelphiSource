package com.embarcadero.expansion.activityimpl;

import java.util.HashMap;

import android.app.Activity;
import android.content.Intent;

import com.embarcadero.expansion.ApkBaseDownloader;
import com.embarcadero.expansion.ApkDownloaderService;
import com.embarcadero.expansion.ApkFileInfo;
import com.embarcadero.expansion.ApkFilesHelper;

public class DownloaderActivityLauncher extends ApkBaseDownloader {
	

    public DownloaderActivityLauncher(String publicKey, byte[] salt,
			ApkFileInfo[] apks) {
		super(publicKey, salt, apks);
	}

	public void setActivityEnabled(boolean enable){
		DownloaderActivity.mEnabled = enable;
    }

    public void setDownloaderLabels(HashMap<String, String> labels){
    	
    	if (labels.containsKey("text_paused_cellular"))
    		DownloaderActivityConfig.text_paused_cellular = labels.get("text_paused_cellular");
    	
    	if (labels.containsKey("text_paused_cellular_2"))
    		DownloaderActivityConfig.text_paused_cellular_2 = labels.get("text_paused_cellular_2");
    	
    	if (labels.containsKey("text_button_resume_cellular"))
    		DownloaderActivityConfig.text_button_resume_cellular = labels.get("text_button_resume_cellular");
    	
    	if (labels.containsKey("text_button_wifi_settings"))
    		DownloaderActivityConfig.text_button_wifi_settings = labels.get("text_button_wifi_settings");
    	
    	if (labels.containsKey("text_verifying_download"))
    		DownloaderActivityConfig.text_verifying_download = labels.get("text_verifying_download");
    	
    	if (labels.containsKey("text_validation_complete"))
    		DownloaderActivityConfig.text_validation_complete = labels.get("text_validation_complete");
    	
    	if (labels.containsKey("text_validation_failed"))
    		DownloaderActivityConfig.text_validation_failed = labels.get("text_validation_failed");
    	
    	if (labels.containsKey("text_button_pause"))
    		DownloaderActivityConfig.text_button_pause = labels.get("text_button_pause");
    	
    	if (labels.containsKey("text_button_resume"))
    		DownloaderActivityConfig.text_button_resume = labels.get("text_button_resume");
    	
    	if (labels.containsKey("text_button_cancel"))
    		DownloaderActivityConfig.text_button_cancel = labels.get("text_button_cancel");
    	
    	if (labels.containsKey("text_button_cancel_verify"))
    		DownloaderActivityConfig.text_button_cancel_verify = labels.get("text_button_cancel_verify");
    	
    	if (labels.containsKey("text_ok"))
    		DownloaderActivityConfig.text_ok = labels.get("text_ok");
    	
    	if (labels.containsKey("text_cancel"))
    		DownloaderActivityConfig.text_cancel = labels.get("text_cancel");
    }
    
    public boolean launch(Activity activity, int requestCode){		
		if (!ApkFilesHelper.areExpansionFilesDelivered(activity, ApkDownloaderService.xAPKS)) {
			if (!DownloaderActivity.isAlive) {
				DownloaderActivity.mEnabled = true;
				Intent intent = new Intent(activity, DownloaderActivity.class);
				activity.startActivityForResult(intent, requestCode);
			}
			return true;
		}
		else
			return false;
	}
}
