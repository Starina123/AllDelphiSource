package com.embarcadero.expansion;

import java.util.HashMap;

import com.google.android.vending.expansion.downloader.NotificationLabels;

public class ApkBaseDownloader {
	
	public ApkBaseDownloader(String publicKey, byte[] salt, ApkFileInfo[] apks){
		ApkDownloaderService.xAPKS = apks;
		ApkDownloaderService.SALT = salt;
		ApkDownloaderService.BASE64_PUBLIC_KEY = publicKey;
	}

	public void setNotificationLabels(HashMap<String, String> labels){
		if (labels.containsKey("notification_download_complete"))
    		NotificationLabels.notification_download_complete = labels.get("notification_download_complete");
    	
    	if (labels.containsKey("notification_download_failed"))
    		NotificationLabels.notification_download_failed = labels.get("notification_download_failed");
    	
    	if (labels.containsKey("state_unknown"))
    		NotificationLabels.state_unknown = labels.get("state_unknown");
    	
    	if (labels.containsKey("state_idle"))
    		NotificationLabels.state_idle = labels.get("state_idle");
    	
    	if (labels.containsKey("state_fetching_url"))
    		NotificationLabels.state_fetching_url = labels.get("state_fetching_url");
    	
    	if (labels.containsKey("state_connecting"))
    		NotificationLabels.state_connecting = labels.get("state_connecting");
    	
    	if (labels.containsKey("state_downloading"))
    		NotificationLabels.state_downloading = labels.get("state_downloading");
    	
    	if (labels.containsKey("state_completed"))
    		NotificationLabels.state_completed = labels.get("state_completed");
    	
    	if (labels.containsKey("state_paused_network_unavailable"))
    		NotificationLabels.state_paused_network_unavailable = labels.get("state_paused_network_unavailable");
    	
    	if (labels.containsKey("state_paused_network_setup_failure"))
    		NotificationLabels.state_paused_network_setup_failure = labels.get("state_paused_network_setup_failure");
    	
    	if (labels.containsKey("state_paused_by_request"))
    		NotificationLabels.state_paused_by_request = labels.get("state_paused_by_request");
    	
    	if (labels.containsKey("state_paused_wifi_unavailable"))
    		NotificationLabels.state_paused_wifi_unavailable = labels.get("state_paused_wifi_unavailable");
    	
    	if (labels.containsKey("state_paused_wifi_disabled"))
    		NotificationLabels.state_paused_wifi_disabled = labels.get("state_paused_wifi_disabled");
    	
    	if (labels.containsKey("state_paused_roaming"))
    		NotificationLabels.state_paused_roaming = labels.get("state_paused_roaming");
    	
    	if (labels.containsKey("state_paused_sdcard_unavailable"))
    		NotificationLabels.state_paused_sdcard_unavailable = labels.get("state_paused_sdcard_unavailable");
    	
    	if (labels.containsKey("state_failed_unlicensed"))
    		NotificationLabels.state_failed_unlicensed = labels.get("state_failed_unlicensed");
    	
    	if (labels.containsKey("state_failed_fetching_url"))
    		NotificationLabels.state_failed_fetching_url = labels.get("state_failed_fetching_url");
    	
    	if (labels.containsKey("state_failed_sdcard_full"))
    		NotificationLabels.state_failed_sdcard_full = labels.get("state_failed_sdcard_full");
    	
    	if (labels.containsKey("state_failed_cancelled"))
    		NotificationLabels.state_failed_cancelled = labels.get("state_failed_cancelled");
    	
    	if (labels.containsKey("state_failed"))
    		NotificationLabels.state_failed = labels.get("state_failed");
    	
    	if (labels.containsKey("kilobytes_per_second"))
    		NotificationLabels.kilobytes_per_second = labels.get("kilobytes_per_second");
    	
    	if (labels.containsKey("time_remaining"))
    		NotificationLabels.time_remaining = labels.get("time_remaining");
    	
    	if (labels.containsKey("time_remaining_notification"))
    		NotificationLabels.time_remaining_notification = labels.get("time_remaining_notification");
	}
}
