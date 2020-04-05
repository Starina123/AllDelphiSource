package com.embarcadero.expansion;

import android.content.Context;
import android.os.storage.StorageManager;
import android.util.Log;

import com.google.android.vending.expansion.downloader.Helpers;

public class ApkFilesHelper {
    
    public static boolean areExpansionFilesDelivered(Context c, ApkFileInfo[] xAPKS) {
    	return areExpansionFilesDelivered(c, xAPKS, false);
    }
    
	public static boolean areExpansionFilesDelivered(Context c, ApkFileInfo[] xAPKS, boolean deleteFileOnMismatch ) {
        for (ApkFileInfo xf : xAPKS) {
            if (!doesExpansionFileExist(c, xf.mIsMain,  xf.mFileVersion, xf.mFileSize,deleteFileOnMismatch))
                return false;
        }
        return true;
    }

	public static boolean doesExpansionFileExist(Context c, boolean isMain, int fileVersion, long fileSize, 
            boolean deleteFileOnMismatch){
		String fileName = Helpers.getExpansionAPKFileName(c, isMain, fileVersion);
		return doesFileExist(c, fileName, fileSize, deleteFileOnMismatch);
	}
	
	public static boolean doesFileExist(Context c, String fileName, long fileSize,
            boolean deleteFileOnMismatch){
		return Helpers.doesFileExist(c, fileName, fileSize, deleteFileOnMismatch);
	}
	
	public static String getExpansionFileName(Context c, boolean isMain, int fileVersion){
		return Helpers.getExpansionAPKFileName(c, isMain, fileVersion);
	}
	
	public static String getExpansionFilePath(Context c, boolean isMain, int fileVersion){
		return Helpers.generateSaveFileName(c, Helpers.getExpansionAPKFileName(c, isMain, fileVersion));
	}
	
	public static String getMountedObbPath(Context c, String filePath){
		StorageManager sm = (StorageManager) c.getSystemService(Context.STORAGE_SERVICE);
		return sm.getMountedObbPath(filePath);
	}
}
