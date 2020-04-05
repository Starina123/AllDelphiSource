package com.embarcadero.firemonkey;

import java.util.ArrayList;

import android.content.Context;
import android.graphics.PixelFormat;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;

public class ViewStack {
	@SuppressWarnings("unused")
	private static final String TAG = "ViewStack";
	
	private static final int NOT_FOCUSABLE_FLAGS =
			  WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE 
			| WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS
			| WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM;  
	private static final int FOCUSABLE_FLAGS =
			  WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL 
			| WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS;

	private ArrayList<View> mViews;
	private final WindowManager mWindowManager;

	public ViewStack(Context context) {
		mWindowManager = SystemServicesHelper.getServiceOrThrow(context, Context.WINDOW_SERVICE, WindowManager.class);
		mViews = new ArrayList<View>();
	}
	
	public void addView(ViewGroup view) {
		if (view == null || mViews.contains(view)) {
			for (View v : mViews) {
				WindowManager.LayoutParams lp = getLayoutParams(v);
				lp.flags = NOT_FOCUSABLE_FLAGS; 
				mWindowManager.updateViewLayout(v, lp);
			}
			
			if (view != null) {
				WindowManager.LayoutParams lp = getLayoutParams(view);
				lp.flags = FOCUSABLE_FLAGS;
				mWindowManager.updateViewLayout(view, lp);
			}
			return;
		} 

		WindowManager.LayoutParams lp = getLayoutParams(view);
		mWindowManager.addView(view, lp);
		mViews.add(view);
	}
	
	public void removeView(ViewGroup view) {
		if (view != null) {
			mViews.remove(view);
			mWindowManager.removeView(view);
		}
	}
	
	public void disableViews() {
		for (View v : mViews) {
			WindowManager.LayoutParams lp = getLayoutParams(v);
			lp.flags = NOT_FOCUSABLE_FLAGS; 
			mWindowManager.updateViewLayout(v, lp);
		}
	}

	public void setPosition(ViewGroup view, int absoluteX, int absoluteY) {
		WindowManager.LayoutParams lp = getLayoutParams(view);
		lp.x = absoluteX;
		lp.y = absoluteY;
		
		if (mViews.contains(view)) {
			mWindowManager.updateViewLayout(view,  lp);
		}
	}

	public void setSize(ViewGroup view, int absoluteWidth, int absoluteHeight) {
		WindowManager.LayoutParams lp = getLayoutParams(view);
		lp.height = absoluteHeight;
		lp.width = absoluteWidth;				
		
		if (mViews.contains(view)) {
			mWindowManager.updateViewLayout(view, lp);
		}
	}
	
	protected WindowManager.LayoutParams getLayoutParams(View view) {
		WindowManager.LayoutParams lp = (WindowManager.LayoutParams) view.getTag();
		if (lp == null) {
			lp = createLayoutParams();
			view.setTag(lp);
		}
		
		return lp;
	}
	
	protected WindowManager.LayoutParams createLayoutParams() {
		WindowManager.LayoutParams p = new WindowManager.LayoutParams();
		p.gravity = Gravity.LEFT | Gravity.TOP;		
		p.width = 0;
		p.height = 0;						
		p.format = PixelFormat.TRANSLUCENT;
		p.softInputMode = WindowManager.LayoutParams.SOFT_INPUT_STATE_UNCHANGED;
		p.flags = NOT_FOCUSABLE_FLAGS;
		// TYPE_APPLICATION allows for popups in browser windows (like edit menus)
		p.type = WindowManager.LayoutParams.TYPE_APPLICATION; 
		p.token = null; 
	
		return p;
	}

}