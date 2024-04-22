package com.cisco.anyconnect.broadcasts;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

import com.cisco.anyconnect.broadcasts.data.GlobalHelper;

import sp.application.two.TestActivity;

public class ReceiverGetter extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Toast.makeText(context, "GET ACTION!", Toast.LENGTH_SHORT).show();
        if (intent == null || context == null || !GlobalHelper.ACTION.equals(intent.getAction()))
            return;

        try {
            Toast.makeText(context, "GET ACTION2!", Toast.LENGTH_SHORT).show();

            String messageType = intent.getStringExtra(GlobalHelper.EXTRA_MESSAGE_TYPE);
            if (messageType == null) return;

            switch (messageType) {
                case GlobalHelper.MESSAGE_START:
                    Toast.makeText(context, "START!!", Toast.LENGTH_SHORT).show();

                    Intent intent1 = new Intent(TestActivity.class.getName());
                    context.startActivity(intent1);

                    Log.d("DD", "DD");

                    Log.d("DD", "FF");

//                    try {
//                        try {
//                            Activity otherAppContext =
//                                    (Activity) context.createPackageContext("com.cisco.anyconnect.vpn.android.ui.CredentialActivity",
//                                            Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
//
//                            Log.d("YEEE", otherAppContext.getClass().getName());
//                        } catch (Exception e) {
//                            Log.d("AN ERR 2", e.toString());
//                        }
//
//                        TestActivity testActivity = new TestActivity();
//
//                        Log.d("YE", testActivity.getClass().getName());
//
//                        TextView textView = testActivity.findViewById(R.id.my_text);
//                        Log.d("GETER", "te: " + textView.getText());
//
//                    } catch (Exception e) {
//                        Log.d("AN ERR", e.toString());
//
//                    }
//                    try {
//                        // بارگذاری کلاس به صورت دینامیک
//                        // AppCompatActivity
////                        Class<?> dynamicClass = Class.forName("DynamicClass");
////
////                        // ساخت یک نمونه از کلاس
////                        Object instance = dynamicClass.newInstance();
////
////                        // تبدیل نمونه به نوع مورد نظر
////                        DynamicClass dynamicInterface = (DynamicClass) instance;
////
////                        // استفاده از متد‌های کلاس
////                        dynamicInterface.dynamicMethod();
//                    } catch (ClassNotFoundException | InstantiationException |
//                             IllegalAccessException e) {
//                        e.printStackTrace();
//                    }
                    break;

                case GlobalHelper.MESSAGE_STOP:
                    Toast.makeText(context, "STOP!!", Toast.LENGTH_SHORT).show();
                    break;
            }
        } catch (Exception ignore) {
        }

    }

}
