package sp.application.two;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.cisco.anyconnect.broadcasts.data.GlobalHelper;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onResume() {
        super.onResume();

        try {
            Intent startIntent = new Intent();
            startIntent.setAction(GlobalHelper.ACTION);
            startIntent.setPackage("sp.application.two");
            startIntent.addFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
            Toast.makeText(this, "SENDED!", Toast.LENGTH_SHORT).show();

            startIntent.putExtra(GlobalHelper.EXTRA_MESSAGE_TYPE, GlobalHelper.MESSAGE_START);

            getApplicationContext().sendBroadcast(startIntent, "sp.cisco.permission.GETTER_INTENT");
        } catch (Exception e) {
            e.printStackTrace();
        }
        //            Intent intent = new Intent();
//            intent.setComponent(
//                    new ComponentName("com.cisco.anyconnect.vpn.android.avf",
//                            "com.cisco.anyconnect.vpn.android.ui.CredentialActivity"));
//            startActivityForResult(intent, 666);

        // نام بسته‌ی برنامه موردنظر که می‌خواهید به آن دسترسی داشته باشید
//        String packageName = "com.example.otherapp";
//
//// ایجاد یک Intent برای اجرای یک Activity در برنامه موردنظر
//        Intent intent = getPackageManager().getLaunchIntentForPackage(packageName);
//        if (intent != null) {
//            // شروع Activity مربوطه برای دریافت Context
//            startActivity(intent);
//
//            // دریافت Context برای Activity مربوطه
//            Activity otherAppContext = (Activity) createPackageContext(packageName,
//                    Context.CONTEXT_IGNORE_SECURITY);
//
//            // پیدا کردن دکمه در Activity مربوطه
//            Button otherAppButton = (Button) otherAppContext.findViewById(R.id.vpn_switch);
//
//            // کلیک کردن بر روی دکمه
//            otherAppButton.performClick();
//        } else {
//            // برنامه موردنظر یافت نشد
//            Toast.makeText(this, "برنامه موردنظر یافت نشد!", Toast.LENGTH_SHORT).show();
//        }


//        try {
//            String packageName = "com.cisco.anyconnect.vpn.android.avf";
//
//            Intent intent = new Intent();
//            intent.setComponent(
//                    new ComponentName(packageName,
//                            "com.cisco.anyconnect.ui.PrimaryActivity"));
//            startActivity(intent);
//
//            Context CiscoContext = createPackageContext(packageName,
//                    Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
//
//
//            int buttonId = CiscoContext.getResources().getIdentifier("vpn_switch", "id", packageName);
//
//            Log.d("CC id", String.valueOf(buttonId));
//
//        } catch (Exception e) {
//            Log.d("ERR", e.toString());
//        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
//            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
//            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
//            return insets;
//        });
    }
}