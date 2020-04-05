package com.google.android.vending.expansion.downloader;

public class NotificationLabels {
	public static String notification_download_complete = "Download complete";
	public static String notification_download_failed = "Download unsuccessful";
	
	public static String state_unknown = "Starting...";
	public static String state_idle = "Waiting for download to start";
	public static String state_fetching_url = "Looking for resources to download";
	public static String state_connecting = "Connecting to the download server";
	public static String state_downloading = "Downloading resources";
	public static String state_completed = "Download finished";
	public static String state_paused_network_unavailable = "Download paused because no network is available";
	public static String state_paused_network_setup_failure = "Download paused. Test a website in browser";
	public static String state_paused_by_request = "Download paused. Test a website in browser";
	public static String state_paused_wifi_unavailable = "Download paused because wifi is unavailable";
	public static String state_paused_wifi_disabled = "Download paused because wifi is disabled";
	public static String state_paused_roaming = "Download paused because you are roaming";
	public static String state_paused_sdcard_unavailable = "Download paused because the external storage is unavailable";
	public static String state_failed_unlicensed = "Download failed because you may not have purchased this app";
	public static String state_failed_fetching_url = "Download failed because the resources could not be found";
	public static String state_failed_sdcard_full = "Download failed because the external storage is full";
	public static String state_failed_cancelled = "Download cancelled";
	public static String state_failed = "Download failed";
	
	public static String kilobytes_per_second = "%1$s KB/s";
	public static String time_remaining = "Time remaining: %1$s";
	public static String time_remaining_notification = "%1$s left";
}
