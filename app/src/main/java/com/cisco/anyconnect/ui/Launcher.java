package com.cisco.anyconnect.ui;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.cisco.anyconnect.dynamic.data.Static;
import com.google.android.material.switchmaterial.SwitchMaterial;

public class Launcher extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Bundle bundle = getIntent().getExtras();
        if (bundle != null) {

            boolean Launch = bundle.getBoolean("Launch", true);
            if (Launch) {
                reqPers();

                SharedPreferences.Editor edit = getSharedPreferences("UserPreferences", 0).edit();
                edit.putBoolean("eula", true); // permission
                edit.putBoolean("BlockUntrustedServers", false); // setting
                edit.commit();

                Intent intent = new Intent(this, PrimaryActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }

            boolean isStart = bundle.getBoolean("isStart", false);
            boolean isActionSwitch = bundle.getBoolean("isActionSwitch", false);

            if (isStart && isActionSwitch && Launch) {
                if (Static.getGlobalData().getMainApplication() == null) {
                    Toast.makeText(this, ":( null", Toast.LENGTH_LONG).show();
                    return;
                }

                Activity activity = (Activity) Static.getGlobalData().getMainApplication();

                try {
                    int buttonId =
                            activity.getResources().getIdentifier(
                                    "vpn_switch", "id", "com.cisco.anyconnect.vpn.android.avf");

                    if (buttonId != 0) {

                        Toast.makeText(this, ":D 1", Toast.LENGTH_LONG).show();

                        SwitchMaterial button = activity.findViewById(buttonId);

                        Toast.makeText(this, ":D !!", Toast.LENGTH_LONG).show();

                        boolean b = button.performContextClick();
                        Toast.makeText(this, ":D c1!!", Toast.LENGTH_LONG).show();
                        if (!b) {
                            button.performClick();
                            Toast.makeText(this, ":D c2!!", Toast.LENGTH_LONG).show();
                        }

                    } else {
                        Toast.makeText(this, ":(( !!", Toast.LENGTH_LONG).show();

                    }
                } catch (Exception e) {
                    Toast.makeText(this, ":((", Toast.LENGTH_LONG).show();

                }
            }

            boolean isChangeServer = bundle.getBoolean("isChangeServer", false);
            String hostName = bundle.getString("hostName", "50");
            String userName = bundle.getString("userName", "null");
            String PassWord = bundle.getString("PassWord", "null");

        } else {
            Toast.makeText(this, "Hi ??", Toast.LENGTH_SHORT).show();
        }

    }

    private void reqPers() {

        if (Build.VERSION.SDK_INT < 29 && this.checkSelfPermission("android.permission" +
                ".READ_PHONE_STATE") != PackageManager.PERMISSION_GRANTED && (this.shouldShowRequestPermissionRationale(
                "android.permission.READ_PHONE_STATE"))) {

            this.requestPermissions(new String[]{"android.permission.READ_PHONE_STATE"}, 10);
        }

        if (Build.VERSION.SDK_INT < 33 || this.checkSelfPermission("android.permission.POST_NOTIFICATIONS") == PackageManager.PERMISSION_GRANTED) {
            return;
        }
        if (this.shouldShowRequestPermissionRationale("android.permission.POST_NOTIFICATIONS")) {

            this.requestPermissions(new String[]{"android.permission.POST_NOTIFICATIONS"}, 11);

            return;
        }

        this.requestPermissions(new String[]{"android.permission.POST_NOTIFICATIONS"}, 11);

    }

}