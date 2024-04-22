package com.cisco.anyconnect.broadcasts.data;

import android.app.Activity;

import androidx.annotation.NonNull;

// I need some object ;-)
public class Global extends GlobalHelper {
    public Global(Activity context) {
        setMainApplication(context);
    }

    @NonNull
    public Activity getMainApplication() {
        assert this.mainApplication != null;
        return this.mainApplication;
    }

    public void setMainApplication(@NonNull Activity mainApplication) {
        this.mainApplication = mainApplication;
    }

}