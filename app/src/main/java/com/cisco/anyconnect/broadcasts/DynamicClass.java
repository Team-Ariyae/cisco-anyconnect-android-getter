package com.cisco.anyconnect.broadcasts;

import android.util.Log;

public class DynamicClass implements DynamicInterface {
    @Override
    public void dynamicMethod() {
        Log.d("APP", "Dynamic method implementation");
    }
}
