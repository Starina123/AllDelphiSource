/*
 * Copyright (C) 2012 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.embarcadero.expansion.activityimpl;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Messenger;
import android.provider.Settings;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.embarcadero.expansion.ApkDownloaderClient;
import com.embarcadero.expansion.ApkDownloaderListener;
import com.embarcadero.expansion.ApkDownloaderService;
import com.embarcadero.expansion.ApkFileInfo;
import com.google.android.vending.expansion.downloader.DownloadProgressInfo;
import com.google.android.vending.expansion.downloader.Helpers;
import com.google.android.vending.expansion.downloader.IDownloaderClient;
import com.google.android.vending.expansion.downloader.IDownloaderService;
import com.google.android.vending.expansion.downloader.NotificationLabels;

/**
 * This is sample code for a project built against the downloader library. It
 * implements the IDownloaderClient that the client marshaler will talk to as
 * messages are delivered from the DownloaderService.
 */
public class DownloaderActivity extends Activity implements ApkDownloaderListener{

	// Constants
	private static final int RESULT_FAILED_CANCELED = 0;
	private static final int RESULT_FAILED = 0;
	private static final int RESULT_FAILED_FETCHING_URL = 0;
	private static final int RESULT_FAILED_UNLICENSED = 0;
    
    // UI fields
    public static String TITLE;
    private ProgressBar mPB;
    private TextView mStatusText;
    private TextView mProgressFraction;
    private TextView mProgressPercent;
    private TextView mAverageSpeed;
    private TextView mTimeRemaining;
    private LinearLayout mDashboard;
    private LinearLayout mCellMessage;
    private Button mPauseButton;
    private Button mWiFiSettingsButton;
    private boolean mStatePaused;
    private int mState;
        
    // Control fields
	public static boolean isAlive = false;
    private boolean mFinished = false;
    public static boolean mEnabled = false;
    
    private ApkDownloaderClient mDownloaderClient;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle(TITLE);
        if(!mEnabled) finish();
        isAlive = true;

        /**
         * Set the Activity as the receiver for notification messages
         * and downloader service progress 
         */
        mDownloaderClient = new ApkDownloaderClient(this, ApkDownloaderService.xAPKS, this);
        if(mDownloaderClient.launch())
        	initializeDownloadUI();
    }

    private void initializeDownloadUI() {
    	

		int progressBarId = 1000;
		int progressAsFractionId = 1001;
        
        LinearLayout linearLayout_696 = new LinearLayout(this);
		linearLayout_696.setOrientation(LinearLayout.VERTICAL);
		LinearLayout.LayoutParams layout_103 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT,  LayoutParams.MATCH_PARENT);
		linearLayout_696.setLayoutParams(layout_103);
		
		LinearLayout linearLayout_621 = new LinearLayout(this);
		linearLayout_621.setOrientation(LinearLayout.VERTICAL);
		LayoutParams layout_818 = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT); //????
		linearLayout_621.setLayoutParams(layout_818);
		
		mStatusText = new TextView(this);
		//statusText.setTypeface(Typeface tf, BOLD);
		LinearLayout.LayoutParams layout_443 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		layout_443.setMargins(5, 10, 0, 10);
		mStatusText.setLayoutParams(layout_443);
		linearLayout_621.addView(mStatusText);
		
		mDashboard = new LinearLayout(this);
		//downloaderDashboard.setId(R.id.downloaderDashboard);
		mDashboard.setOrientation(LinearLayout.VERTICAL);
		LinearLayout.LayoutParams layout_426 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		mDashboard.setLayoutParams(layout_426);
		
		RelativeLayout relativeLayout_546 = new RelativeLayout(this);
		LinearLayout.LayoutParams layout_854 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		layout_854.weight = 1;
		relativeLayout_546.setLayoutParams(layout_854);
		
		mProgressFraction = new TextView(this);
		mProgressFraction.setId(progressAsFractionId);
		mProgressFraction.setText("0MB / 0MB");
		RelativeLayout.LayoutParams layout_788 = new RelativeLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		layout_788.setMargins(5, 0, 0, 0);
		layout_788.addRule(RelativeLayout.ALIGN_PARENT_LEFT);
		mProgressFraction.setLayoutParams(layout_788);
		relativeLayout_546.addView(mProgressFraction);
		
		mProgressPercent = new TextView(this);
		//progressAsPercentage.setId(R.id.progressAsPercentage);
		mProgressPercent.setText("0%");
		RelativeLayout.LayoutParams layout_583 = new RelativeLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		mProgressPercent.setLayoutParams(layout_583);
		layout_583.addRule(RelativeLayout.ALIGN_RIGHT, progressBarId);
		relativeLayout_546.addView(mProgressPercent);
		
		mPB = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
		mPB.setId(progressBarId);
		RelativeLayout.LayoutParams layout_505 = new RelativeLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		layout_505.setMargins(10, 10, 10, 10);
		layout_505.addRule(RelativeLayout.BELOW, progressAsFractionId);
		mPB.setLayoutParams(layout_505);
		relativeLayout_546.addView(mPB);
		
		mAverageSpeed = new TextView(this);
		//progressAverageSpeed.setId(R.id.progressAverageSpeed);
		RelativeLayout.LayoutParams layout_970 = new RelativeLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);

		layout_970.setMargins(5, 0, 0, 0);
		mAverageSpeed.setLayoutParams(layout_970);
		layout_970.addRule(RelativeLayout.ALIGN_PARENT_LEFT);
		layout_970.addRule(RelativeLayout.BELOW, progressBarId);
		relativeLayout_546.addView(mAverageSpeed);
		
		mTimeRemaining = new TextView(this);
		//progressTimeRemaining.setId(R.id.progressTimeRemaining);
		RelativeLayout.LayoutParams layout_957 = new RelativeLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		mTimeRemaining.setLayoutParams(layout_957);
		layout_957.addRule(RelativeLayout.ALIGN_RIGHT, progressBarId);
		layout_957.addRule(RelativeLayout.BELOW, progressBarId);
		relativeLayout_546.addView(mTimeRemaining);
		mDashboard.addView(relativeLayout_546);
		
		LinearLayout downloaderDashboard2 = new LinearLayout(this);
		//downloaderDashboard.setId(R.id.downloaderDashboard);
		downloaderDashboard2.setOrientation(LinearLayout.HORIZONTAL);
		LinearLayout.LayoutParams layout_705 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		downloaderDashboard2.setLayoutParams(layout_705);
		
		mPauseButton = new Button(this);
		//pauseButton.setId(R.id.pauseButton);
		mPauseButton.setMinimumHeight((int) (40/getApplicationContext().getResources().getDisplayMetrics().density));
		mPauseButton.setMinimumWidth((int) (94/getApplicationContext().getResources().getDisplayMetrics().density));
		LinearLayout.LayoutParams layout_523 = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		layout_523.gravity = Gravity.CENTER_VERTICAL;
		layout_523.setMargins(10, 10, 5, 10);
		layout_523.weight = 0;
		mPauseButton.setLayoutParams(layout_523);
		downloaderDashboard2.addView(mPauseButton);
		
		Button mCancelButton = new Button(this);
		//cancelButton.setId(R.id.cancelButton);
		mCancelButton.setMinimumHeight((int) (40/getApplicationContext().getResources().getDisplayMetrics().density));
		mCancelButton.setMinimumWidth((int) (94/getApplicationContext().getResources().getDisplayMetrics().density));
		mCancelButton.setVisibility(LinearLayout.GONE);
		LinearLayout.LayoutParams layout_286 = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		layout_286.gravity = Gravity.CENTER_VERTICAL;
		layout_286.setMargins(5, 10, 5, 10);
		layout_286.weight = 0;
		mCancelButton.setLayoutParams(layout_286);
		downloaderDashboard2.addView(mCancelButton);
		mDashboard.addView(downloaderDashboard2);
		linearLayout_621.addView(mDashboard);
		linearLayout_696.addView(linearLayout_621);
		
		mCellMessage = new LinearLayout(this);
		//approveCellular.setId(R.id.approveCellular);
		mCellMessage.setOrientation(LinearLayout.VERTICAL);
		mCellMessage.setVisibility(LinearLayout.GONE);
		LinearLayout.LayoutParams layout_298 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
		layout_298.weight = 1;
		mCellMessage.setLayoutParams(layout_298);
		
		TextView mTextPausedParagraph1 = new TextView(this);
		//textPausedParagraph1.setId(R.id.textPausedParagraph1);
		LinearLayout.LayoutParams layout_63 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		mTextPausedParagraph1.setLayoutParams(layout_63);
		mCellMessage.addView(mTextPausedParagraph1);
		
		TextView mTextPausedParagraph2 = new TextView(this);
		//textPausedParagraph2.setId(R.id.textPausedParagraph2);
		LinearLayout.LayoutParams layout_784 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		mTextPausedParagraph2.setLayoutParams(layout_784);
		mCellMessage.addView(mTextPausedParagraph2);
		
		LinearLayout buttonRow = new LinearLayout(this);
		//buttonRow.setId(R.id.buttonRow);
		buttonRow.setOrientation(LinearLayout.HORIZONTAL);
		LinearLayout.LayoutParams layout_648 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		buttonRow.setLayoutParams(layout_648);
		
		Button mResumeOverCellularButton = new Button(this);
		//resumeOverCellular.setId(R.id.resumeOverCellular);
		LinearLayout.LayoutParams layout_78 = new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		layout_78.gravity = Gravity.CENTER;
		mResumeOverCellularButton.setLayoutParams(layout_78);
		buttonRow.addView(mResumeOverCellularButton);
		
		mWiFiSettingsButton = new Button(this);
		//wifiSettingsButton.setId(R.id.wifiSettingsButton);
		LinearLayout.LayoutParams layout_46 = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		layout_46.gravity = Gravity.CENTER;
		mWiFiSettingsButton.setLayoutParams(layout_46);
		buttonRow.addView(mWiFiSettingsButton);
		mCellMessage.addView(buttonRow);
		linearLayout_696.addView(mCellMessage);
        
        setContentView(linearLayout_696);
        
        // Setting the labels
        mPauseButton.setText(DownloaderActivityConfig.text_button_pause);
        mCancelButton.setText(DownloaderActivityConfig.text_button_cancel);
        mTextPausedParagraph1.setText(DownloaderActivityConfig.text_paused_cellular);
        mTextPausedParagraph2.setText(DownloaderActivityConfig.text_paused_cellular_2);
        mResumeOverCellularButton.setText(DownloaderActivityConfig.text_button_resume_cellular);
        mWiFiSettingsButton.setText(DownloaderActivityConfig.text_button_wifi_settings);
        
        mPauseButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (mStatePaused) {
                    mDownloaderClient.getDownloaderService().requestContinueDownload();
                } else {
                	mDownloaderClient.getDownloaderService().requestPauseDownload();
                }
                setButtonPausedState(!mStatePaused);
            }
        });

        mWiFiSettingsButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                startActivity(new Intent(Settings.ACTION_WIFI_SETTINGS));
            }
        });

        //Button resumeOnCell = (Button) findViewById(R.id.resumeOverCellular);
        mResumeOverCellularButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
            	mDownloaderClient.getDownloaderService().setDownloadFlags(IDownloaderService.FLAGS_DOWNLOAD_OVER_CELLULAR);
            	mDownloaderClient.getDownloaderService().requestContinueDownload();
                mCellMessage.setVisibility(View.GONE);
            }
        });

    }
    
    private void setState(int newState) {
        if (mState != newState) {
            mState = newState;
            mStatusText.setText(Helpers.getDownloaderStringResourceIDFromState(newState));
        }
    }

    private void setButtonPausedState(boolean paused) {
        mStatePaused = paused;
        String text = paused ? DownloaderActivityConfig.text_button_resume :
        	DownloaderActivityConfig.text_button_pause;
        mPauseButton.setText(text);
    }
   
    // Prevents go back Activity while downloading
    public void onBackPressed() {
    	
    }


    /**
     * Connect the stub to our service on start.
     */
    @Override
    protected void onStart() {
        if (null != mDownloaderClient.getDownloaderClientStub()) {
        	mDownloaderClient.getDownloaderClientStub().connect(this);
        }
        super.onStart();
    }

    /**
     * Disconnect the stub from our service on stop
     */
    @Override
    protected void onStop() {
        if (null != mDownloaderClient.getDownloaderClientStub()) {
        	mDownloaderClient.getDownloaderClientStub().disconnect(this);
        }
        super.onStop();
    }

    

    /**
     * The download state should trigger changes in the UI --- it may be useful
     * to show the state as being indeterminate at times. This sample can be
     * considered a guideline.
     */
    @Override
    public void onDownloadStateChanged(int newState) {
        setState(newState);
        boolean showDashboard = true;
        boolean showCellMessage = false;
        boolean paused;
        boolean indeterminate;
        switch (newState) {
            case IDownloaderClient.STATE_IDLE:
                // STATE_IDLE means the service is listening, so it's
                // safe to start making calls via mRemoteService.
                paused = false;
                indeterminate = true;
                break;
            case IDownloaderClient.STATE_CONNECTING:
            case IDownloaderClient.STATE_FETCHING_URL:
                showDashboard = true;
                paused = false;
                indeterminate = true;
                break;
            case IDownloaderClient.STATE_DOWNLOADING:
                paused = false;
                showDashboard = true;
                indeterminate = false;
                break;

            case IDownloaderClient.STATE_FAILED_CANCELED:
            	finishWithCode(RESULT_FAILED_CANCELED); return;
            case IDownloaderClient.STATE_FAILED:
            	finishWithCode(RESULT_FAILED);return;
            case IDownloaderClient.STATE_FAILED_FETCHING_URL:
            	finishWithCode(RESULT_FAILED_FETCHING_URL);return;
            case IDownloaderClient.STATE_FAILED_UNLICENSED:
            	finishWithCode(RESULT_FAILED_UNLICENSED);return;
                //paused = true;
                //showDashboard = false;
                //indeterminate = false;
               // break;
            case IDownloaderClient.STATE_PAUSED_NEED_CELLULAR_PERMISSION:
            case IDownloaderClient.STATE_PAUSED_WIFI_DISABLED_NEED_CELLULAR_PERMISSION:
                showDashboard = false;
                paused = true;
                indeterminate = false;
                showCellMessage = true;
                break;

            case IDownloaderClient.STATE_PAUSED_BY_REQUEST:
                paused = true;
                indeterminate = false;
                break;
            case IDownloaderClient.STATE_PAUSED_ROAMING:
            case IDownloaderClient.STATE_PAUSED_SDCARD_UNAVAILABLE:
                paused = true;
                indeterminate = false;
                break;
            case IDownloaderClient.STATE_COMPLETED:
                showDashboard = false;
                paused = false;
                indeterminate = false;
                finishWithCode(RESULT_OK);
                return;
            default:
                paused = true;
                indeterminate = true;
                showDashboard = true;
        }
        int newDashboardVisibility = showDashboard ? View.VISIBLE : View.GONE;
        if (mDashboard.getVisibility() != newDashboardVisibility) {
            mDashboard.setVisibility(newDashboardVisibility);
        }
        int cellMessageVisibility = showCellMessage ? View.VISIBLE : View.GONE;
        if (mCellMessage.getVisibility() != cellMessageVisibility) {
            mCellMessage.setVisibility(cellMessageVisibility);
        }

        mPB.setIndeterminate(indeterminate);
        setButtonPausedState(paused);
    }

    /**
     * Sets the state of the various controls based on the progressinfo object
     * sent from the downloader service.
     */
    @Override
    public void onDownloadProgress(DownloadProgressInfo progress) {
        mAverageSpeed.setText(String.format(NotificationLabels.kilobytes_per_second, Helpers.getSpeedString(progress.mCurrentSpeed)));
        mTimeRemaining.setText(String.format(NotificationLabels.time_remaining, Helpers.getTimeRemaining(progress.mTimeRemaining)));
        progress.mOverallTotal = progress.mOverallTotal;
        mPB.setMax((int) (progress.mOverallTotal >> 8));
        mPB.setProgress((int) (progress.mOverallProgress >> 8));
        mProgressPercent.setText(Long.toString(progress.mOverallProgress * 100 / progress.mOverallTotal) + "%");
        mProgressFraction.setText(Helpers.getDownloadProgressString(progress.mOverallProgress, progress.mOverallTotal));
    }


    void finishWithCode(int resultCode) {
    	if(!mFinished){
        	mFinished = true;
        	setResult(resultCode);
        	finish();
    	}
    }

}
