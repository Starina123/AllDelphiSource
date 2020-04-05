package com.embarcadero.firemonkey.fullscreen;

/**
 * Interface definition for a callback to be invoked when activity changed a configuration visibility of System bar
 * and System buttons panel.
 */
public interface OnFullScreenStateChangedListener {

    /**
     * It's invoked, when {@link FullScreenManager} changed internal state.
     *
     * @param oldState old state of FullScreenManager
     * @param newState new state
     */
    void stateChanged(int oldState, int newState);
}
