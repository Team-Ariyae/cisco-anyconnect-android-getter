package sp.application.two;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Button;
import android.widget.Toast;

import com.cisco.anyconnect.dynamic.data.GlobalHelper;
import com.cisco.anyconnect.dynamic.data.Static;

public class ReceiverGetter extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Toast.makeText(context, "GET ACTION!", Toast.LENGTH_SHORT).show();
        if (intent == null || context == null || !GlobalHelper.ACTION.equals(intent.getAction()))
            return;

        try {
            String messageType = intent.getStringExtra(GlobalHelper.EXTRA_MESSAGE_TYPE);
            if (messageType == null) return;

            switch (messageType) {
                case GlobalHelper.MESSAGE_START:
                    Toast.makeText(context, "START!!", Toast.LENGTH_SHORT).show();

                    Activity activity = (Activity) Static.getGlobalData().getMainApplication();

                    try {
                        int buttonId =
                                activity.getResources().getIdentifier(
                                        "vpn_switch", "id", "com.cisco.anyconnect.vpn.android.avf");

                        if (buttonId != 0) {

                            Button button = activity.findViewById(buttonId);

                            Toast.makeText(context, ":D !!", Toast.LENGTH_LONG).show();
//                button.setOnClickListener(new View.OnClickListener() {
//                    @Override
//                    public void onClick(View v) {
//                        // عملیاتی که بعد از کلیک انجام می‌شود
//                        // مثلا می‌توانید یک Intent برای اجرای یک Activity دیگر ایجاد کنید
//                    }
//                });
                        } else {
                            Log.e("Error", "Button not found");
                        }
                    } catch (Exception e) {
                        Log.e("Error", "Package not found");
                    }

                    break;

                case GlobalHelper.MESSAGE_STOP:
                    Toast.makeText(context, "STOP!!", Toast.LENGTH_SHORT).show();
                    break;
            }
        } catch (Exception ignore) {
        }

    }

}
