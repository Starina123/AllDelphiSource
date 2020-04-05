package com.embarcadero.firemonkey.nativelayout;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;

public class NativeControlHost {
	private LinearLayout.LayoutParams mLayoutParams;
	private LinearLayout mLinearLayout;
	private View mHostedView;
	
	public NativeControlHost(Context context) {
		super();

		mLinearLayout = new LinearLayout(context);
		mLayoutParams = new LinearLayout.LayoutParams(0, 0);
	}
	
	public void setControl(View view) {		
		mHostedView = view;
		mLinearLayout.addView(mHostedView, mLayoutParams);		
	}
	
	public void setPosition(int absoluteX, int absoluteY) {
		mLayoutParams.leftMargin = absoluteX;
		mLayoutParams.topMargin = absoluteY;
		
		if (mHostedView != null) {
			mLinearLayout.updateViewLayout(mHostedView, mLayoutParams);
		}
	}
	
	public void setSize(int absoluteWidth, int absoluteHeight) {
		mLayoutParams.width = absoluteWidth;				
		mLayoutParams.height = absoluteHeight;
		
		if (mHostedView != null) {
			mLinearLayout.updateViewLayout(mHostedView, mLayoutParams);
		}
	}
	
	public void setFocus(boolean newFocusState){
		if (mHostedView != null) {
			if (newFocusState) {
				mHostedView.setFocusable(true);
				mHostedView.setFocusableInTouchMode(true);
				mHostedView.requestFocus();
			} else {
				mHostedView.clearFocus();
			}
		}
	}
	
	public void setFocusable(boolean focusable) {
		mHostedView.setFocusable(focusable);
		mHostedView.setFocusableInTouchMode(focusable);
		if (!focusable) {
			mHostedView.clearFocus();
		}
	}
	
	public View getView() {
		return mLinearLayout;
	}
}
