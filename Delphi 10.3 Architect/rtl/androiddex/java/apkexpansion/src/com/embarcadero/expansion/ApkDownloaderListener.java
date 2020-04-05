package com.embarcadero.expansion;

import com.google.android.vending.expansion.downloader.DownloadProgressInfo;

public interface ApkDownloaderListener{
	void onDownloadStateChanged(int newState);
	void onDownloadProgress(DownloadProgressInfo progress);
}