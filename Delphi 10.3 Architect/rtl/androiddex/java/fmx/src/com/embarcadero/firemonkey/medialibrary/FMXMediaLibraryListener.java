package com.embarcadero.firemonkey.medialibrary;

public interface FMXMediaLibraryListener {
    void OnMediaLibraryCancel(int requestCode);
    void OnMediaLibraryAccept(int requestCode);
}
