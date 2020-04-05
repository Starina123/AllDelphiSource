package com.embarcadero.expansion;

import android.content.Context;

public class ApkFileInfo {
    public final boolean mIsMain;
    public final int mFileVersion;
    public final long mFileSize;
    public final String mEncriptKey;

    public ApkFileInfo(boolean isMain, int fileVersion, long fileSize, String encriptKey) {
        mIsMain = isMain;
        mFileVersion = fileVersion;
        mFileSize = fileSize;
        mEncriptKey = encriptKey;
    }
    
    public Obb getObb(Context c) {
    	if (ApkFilesHelper.doesExpansionFileExist(c, mIsMain,  mFileVersion, mFileSize, false)){
    		return new Obb(c, this);
    	}
		return null;
    }
}
