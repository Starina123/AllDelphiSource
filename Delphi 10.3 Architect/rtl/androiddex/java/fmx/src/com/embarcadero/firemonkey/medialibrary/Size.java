/**
 * {*******************************************************}
 * {                                                       }
 * {        Delphi FireMonkey Media Library Service        }
 * {                                                       }
 * {   Implementation Media Library Service for Android    }
 * {                                                       }
 * { Copyright(c) 2013-2014 Embarcadero Technologies, Inc. }
 * {                                                       }
 * {*******************************************************}
 */
package com.embarcadero.firemonkey.medialibrary;

public class Size {

	private int mWidth = 0;
	private int mHeight = 0;

	public Size(int width, int height) {
		mWidth = width;
		mHeight = height;
	}

	public int getWidth() {
		return mWidth;
	}

	public int getHeight() {
		return mHeight;
	}

	public boolean isEmpty() {
		return (mHeight <= 0) || (mWidth <= 0);
	}
}
