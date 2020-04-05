package com.embarcadero.firebase.provider;

import android.content.Context;
import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;

import java.util.Objects;

/**
 * Reads the FireBase settings from application string resources "res\values\strings.xml".
 */
@SuppressWarnings("WeakerAccess")
public class FirebaseSettingsReader {

    @NonNull
    private final Context context;

    public FirebaseSettingsReader(@NonNull Context context) {
        this.context = Objects.requireNonNull(context, "context");
    }

    @Nullable
    public String getSenderId() {
        return getStringResourceValue("string/gcm_defaultSenderId", null);
    }

    @NonNull
    public String getApplicationId() {
        return getStringResourceValue("string/google_app_id", "");
    }

    @Nullable
    public String getApiKey() {
        return getStringResourceValue("string/google_api_key", null);
    }

    @Nullable
    public String getDatabaseUrl() {
        return getStringResourceValue("string/firebase_database_url", null);
    }

    @Nullable
    public String getGaTrackingId() {
        return getStringResourceValue("string/ga_trackingId", null);
    }

    @NonNull
    public String getProjectId() {
        return getStringResourceValue("string/project_id", null);
    }

    @Nullable
    public String getStorageBucket() {
        return getStringResourceValue("string/google_storage_bucket", null);
    }

    private String getStringResourceValue(@NonNull String resName, @Nullable String defaultValue) {
        Objects.requireNonNull(resName, "resName");

        String resourceValue = defaultValue;
        Resources resources = context.getResources();
        int resourceId = resources.getIdentifier(resName, null, context.getPackageName());
        if (resourceId != 0) {
            try {
                resourceValue = resources.getString(resourceId);
            } catch (Resources.NotFoundException e) {
                Log.d("FIREBASE_INIT_PROVIDER", String.format("Cannot get string resource value: resName=%s, e=%s", resName, e));
            }
        }
        return resourceValue;
    }


}
