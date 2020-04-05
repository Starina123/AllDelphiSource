/**
 * {*******************************************************}
 * {                                                       }
 * {            Delphi FireMonkey Pickers Service          }
 * {                                                       }
 * {          Implementation of Pickers for Android        }
 * {                                                       }
 * { Copyright(c) 2013-2014 Embarcadero Technologies, Inc. }
 * {                                                       }
 * {*******************************************************}
 */
package com.embarcadero.firemonkey.pickers;

public class GeneratorPickerID {

	static protected int mID = 0; 
	
	static public int getUniqueID()
	{
		return mID++;
	}
}
