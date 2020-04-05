package com.embarcadero.firebase.provider;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import java.util.Objects;

/**
 * Responsible for starting the initialization FireBaseApp. The provider extracts the initialization parameters from
 * "res\values\strings.xml" file.
 *
 * <p/>
 *
 * To use this provider, add the following entry to the manifest:
 *
 * <pre>{@code
 * <provider
 *     android:name="com.embarcadero.firebase.provider.FirebaseInitProvider"
 *     android:authorities="com.embarcadero.FireBaseDemo.firebaseinitprovider"
 *     android:exported="false"
 *     android:initOrder="100" />
 * }</pre>
 *
 * Typical context of "res\values\strings.xml" file for supporting FireBase options.
 *
 * <pre>{@code
 * <?xml version="1.0" encoding="utf-8"?>
 * <resources>
 *     <string name="firebase_database_url" translatable="false">https://fir-message-69b0e.firebaseio.com</string>
 *     <string name="gcm_defaultSenderId" translatable="false">682701400465</string>
 *     <string name="google_api_key" translatable="false">AIzaSyAv8-TBR9Y1IkOAnGCnbRqK_RiAOFiY7cU</string>
 *     <string name="google_app_id" translatable="false">1:682701400465:android:5920de3503a2d18c</string>
 *     <string name="google_crash_reporting_api_key" translatable="false">AIzaSyAv8-TBR9Y1IkOAnGCnbRqK_RiAOFiY7cU</string>
 *     <string name="google_storage_bucket" translatable="false">fir-message-69b0e.appspot.com</string>
 *     <string name="project_id" translatable="false">fir-message-69b0e</string>
 * </resources>
 * }</pre>
 */
public class FirebaseInitProvider extends ContentProvider {

    public FirebaseInitProvider() {
    }

    @Override
    public void attachInfo(Context context, ProviderInfo info) {
        checkContentProviderAuthority(info);
        super.attachInfo(context, info);
    }

    @Override
    public boolean onCreate() {
        Context context = getContext();

        Objects.requireNonNull(context, "context");

        FirebaseOptions options = readFirebaseOptions(context);
        FirebaseApp.initializeApp(context, options);

        return false;
    }

    /**
     * Reads Firebase options from application string resources "strings.xml".
     */
    @NonNull
    private FirebaseOptions readFirebaseOptions(@NonNull Context context) {
        Objects.requireNonNull(context, "context");

        FirebaseSettingsReader settingsReader = new FirebaseSettingsReader(context);
        FirebaseOptions.Builder builder = new FirebaseOptions.Builder()
                .setProjectId(settingsReader.getProjectId())
                .setGcmSenderId(settingsReader.getSenderId())
                .setDatabaseUrl(settingsReader.getDatabaseUrl())
                .setGaTrackingId(settingsReader.getGaTrackingId())
                .setStorageBucket(settingsReader.getStorageBucket());

        // FirebaseOptions.Builder doesn't allow to pass null api key and empty applicationId. So we need to make precheck.
        String applicationId = settingsReader.getApplicationId();
        if (!applicationId.equals("")) {
            builder.setApplicationId(applicationId);
        }

        String apiKey = settingsReader.getApiKey();
        if (apiKey != null) {
            builder.setApiKey(apiKey);
        }

        return builder.build();
    }

    private static void checkContentProviderAuthority(@NonNull ProviderInfo info) {
        Objects.requireNonNull(info, "FirebaseInitProvider ProviderInfo cannot be null.");

        if ("com.google.firebase.firebaseinitprovider".equals(info.authority)) {
            throw new IllegalStateException("Incorrect provider authority in manifest. Most likely due to a missing applicationId variable in application's build.gradle.");
        }
    }

    @Nullable
    public Cursor query(@NonNull Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Nullable
    public String getType(@NonNull Uri uri) {
        return null;
    }

    @Nullable
    public Uri insert(@NonNull Uri uri, ContentValues values) {
        return null;
    }

    public int delete(@NonNull Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    public int update(@NonNull Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
