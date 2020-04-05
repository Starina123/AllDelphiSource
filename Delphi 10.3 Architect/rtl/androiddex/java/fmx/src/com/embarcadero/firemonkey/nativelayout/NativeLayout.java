package com.embarcadero.firemonkey.nativelayout;

import com.embarcadero.firemonkey.FMXNativeActivity;

import android.content.Context;
import android.os.IBinder;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnFocusChangeListener;
import android.widget.LinearLayout;

public class NativeLayout {
	@SuppressWarnings("unused")
	private final static String TAG = "NativeLayout";
	
	private Context mContext;
	@SuppressWarnings("unused")
	private IBinder mParent;	
	private LinearLayout mLayout;
	
	private OnFocusChangeListener mOnFocusChangeListener;
	
	class LinearLayout2 extends LinearLayout {
		public LinearLayout2(Context context) {
			super(context);
			this.setFocusable(false);
			this.setEnabled(false);
		}

		@Override
		public boolean dispatchKeyEvent(KeyEvent ev) {
			boolean result = false;
			if (ev.getAction() == KeyEvent.ACTION_DOWN) {
				switch (ev.getKeyCode()) {
					case KeyEvent.KEYCODE_BACK:
					case KeyEvent.KEYCODE_MENU:{					
						((FMXNativeActivity)mContext).getViewStack().disableViews();						
						break;
					}
					default:
						result = super.dispatchKeyEvent(ev);
				}
			}			
			return result;
		}
		
		@Override
		public boolean dispatchTouchEvent(MotionEvent event) {
			final FMXNativeActivity context = (FMXNativeActivity) NativeLayout.this.mContext;
			context.getEditText().setFocusable(false);
			context.getVirtualKeyboard().hide(context.getEditText());
			getHandler().postDelayed(new Runnable() {
				@Override
				public void run() {
					// make this window focusable
					context.getViewStack().addView(LinearLayout2.this);
					
					// notify the framework of focus transfer
					if (mOnFocusChangeListener != null) {
						mOnFocusChangeListener.onFocusChange(LinearLayout2.this, true);
					}
				}
				
			}, 250); 
			return super.dispatchTouchEvent(event);
		}
	}
	
	public NativeLayout(Context Con, IBinder Token) {
		super();
		mContext = Con;
		mParent = Token;
	}
	
	public void setControl(View view) {
		if (view != null) {
			mLayout = new LinearLayout2(mContext);
			mLayout.addView(view, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT));		
			((FMXNativeActivity)mContext).getViewStack().addView(mLayout);
		} else {
			mLayout.removeAllViews();
			((FMXNativeActivity)mContext).getViewStack().removeView(mLayout);
			mLayout = null;
		}
	}
	
	public void setPosition(int absoluteX, int absoluteY) {
		Log.d(TAG, "setPosition " + absoluteX + " " + absoluteY + " mLayout=" + mLayout);
		if (mLayout != null) {
			((FMXNativeActivity)mContext).getViewStack().setPosition(mLayout, absoluteX, absoluteY);
		}
	}
	
	public void setSize(int absoluteWidth, int absoluteHeight) {
		if (mLayout != null) {
			((FMXNativeActivity)mContext).getViewStack().setSize(mLayout, absoluteWidth, absoluteHeight);
		}	
	}
	
	public void setFocus(boolean newFocusState) {
		/*
		Log.d(TAG, "NativeLayout.SetFocus: newFocusState=" + newFocusState);
		if ( newFocusState ){
			this.flags = FocusableFlags;
		}
		else {
			this.flags = NotFocusableFlags;
		}
		mWindowManager.updateViewLayout(ll, this);	
		*/	
	}
	
	public void setOnFocusChangeListener(OnFocusChangeListener listener) {
		mOnFocusChangeListener = listener;
	}
	
}
