package com.cisco.anyconnect.broadcasts.data;

import android.content.Context;

import androidx.annotation.NonNull;

// I need some object ;-)
public class Global extends GlobalHelper {
    public Global(Context context) {
        setMainApplication(context);
    }

    @NonNull
    public Context getMainApplication() {
        assert this.mainApplication != null;
        return this.mainApplication;
    }

    public void setMainApplication(@NonNull Context mainApplication) {
        this.mainApplication = mainApplication;
    }

}