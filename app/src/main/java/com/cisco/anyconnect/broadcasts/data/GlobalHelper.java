package sp.application.two.broadcasts.data;

import android.app.Activity;
import android.app.Application;

import androidx.annotation.Nullable;

public class GlobalHelper {
    @Nullable
    protected Activity mainApplication;

    public static final String EXTRA_MESSAGE_TYPE = "MESSAGE_TYPE";
    public static final String MESSAGE_START = "START";
    public static final String MESSAGE_STOP = "STOP";

    public static final String ACTION = "sp.cisco.GETTER_INTENT";
}
