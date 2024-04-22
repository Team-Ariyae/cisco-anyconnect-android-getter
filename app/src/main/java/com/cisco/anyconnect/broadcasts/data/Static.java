package com.cisco.anyconnect.broadcasts.data;

import android.app.Activity;

import androidx.annotation.NonNull;

// Static objects
public class Static {
    // All data
    private static Global globalData;

    @NonNull
    public static Global getGlobalData() {
        assert globalData != null;
        return globalData;
    }

    public static void setGlobalData(@NonNull Activity context) {
        // is should be to null
        assert globalData == null;
        globalData = new Global(context);
    }
}