package com.cisco.anyconnect.dynamic.data;

import android.content.Context;

public class GlobalHelper {
    protected Context mainApplication; // no memory leak

    public static final String EXTRA_MESSAGE_TYPE = "MESSAGE_TYPE";
    public static final String MESSAGE_START = "START";
    public static final String MESSAGE_STOP = "STOP";

    public static final String ACTION = "sp.cisco.GETTER_INTENT";
}
