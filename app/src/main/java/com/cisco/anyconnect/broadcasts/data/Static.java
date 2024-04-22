package com.cisco.anyconnect.broadcasts.data;

import android.app.Activity;

import androidx.annotation.NonNull;

import java.util.concurrent.CountDownLatch;

public class Static {
    // All data
    private static Global globalData;
    private static final CountDownLatch latch = new CountDownLatch(1);

    @NonNull
    public static Global getGlobalData() {
        if (globalData == null) {
            try {
                latch.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        assert globalData != null; // حتما مقداردهی شده است
        return globalData;
    }

    public static void setGlobalData(@NonNull Activity context) {
        // is should be to null
        //assert globalData == null;
        globalData = new Global(context);
        latch.countDown(); // اطلاع رسانی به انتظار کنندگان که مقداردهی انجام شده است
    }
}
