package com.embarcadero.firemonkey.webbrowser;

import android.content.Context;
import android.webkit.WebChromeClient;
import android.webkit.WebView;

public class WebBrowser extends WebView {

	private WebClient mWebClient;
	private WebChromeClient mWebChromeClient;
		
	public WebBrowser(Context context) {
		super(context);		
		mWebClient = new WebClient();
		this.setWebViewClient(mWebClient);
		mWebChromeClient = new WebChromeClient();
		this.setWebChromeClient(mWebChromeClient);
		this.setFocusable(true);
	}
	
	public void SetWebViewListener(OnWebViewListener listener){
		mWebClient.SetWebViewListener(listener);
	}
	
	//@Override
	//public boolean performLongClick() {
	//	return true;
	//}
}
