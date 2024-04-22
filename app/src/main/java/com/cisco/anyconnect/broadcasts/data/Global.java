package sp.application.two.broadcasts.data;

import android.app.Application;

import androidx.annotation.NonNull;

// I need some object ;-)
public class Global extends GlobalHelper {
    public Global(Application context) {
        setMainApplication(context);
    }

    @NonNull
    public Application getMainApplication() {
        assert this.mainApplication != null;
        return this.mainApplication;
    }

    public void setMainApplication(@NonNull Application mainApplication) {
        this.mainApplication = mainApplication;
    }

}