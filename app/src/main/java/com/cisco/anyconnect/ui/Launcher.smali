.class public Lcom/cisco/anyconnect/ui/Launcher;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "Launcher.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private reqPers()V
    .registers 6

    .prologue
    const/16 v4, 0xb

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 92
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_25

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-virtual {p0, v0}, Lcom/cisco/anyconnect/ui/Launcher;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_25

    const-string v0, "android.permission.READ_PHONE_STATE"

    .line 93
    invoke-virtual {p0, v0}, Lcom/cisco/anyconnect/ui/Launcher;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 96
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "android.permission.READ_PHONE_STATE"

    aput-object v1, v0, v2

    const/16 v1, 0xa

    invoke-virtual {p0, v0, v1}, Lcom/cisco/anyconnect/ui/Launcher;->requestPermissions([Ljava/lang/String;I)V

    .line 99
    :cond_25
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_33

    const-string v0, "android.permission.POST_NOTIFICATIONS"

    invoke-virtual {p0, v0}, Lcom/cisco/anyconnect/ui/Launcher;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_34

    .line 111
    :cond_33
    :goto_33
    return-void

    .line 102
    :cond_34
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    invoke-virtual {p0, v0}, Lcom/cisco/anyconnect/ui/Launcher;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 104
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "android.permission.POST_NOTIFICATIONS"

    aput-object v1, v0, v2

    invoke-virtual {p0, v0, v4}, Lcom/cisco/anyconnect/ui/Launcher;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_33

    .line 109
    :cond_46
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "android.permission.POST_NOTIFICATIONS"

    aput-object v1, v0, v2

    invoke-virtual {p0, v0, v4}, Lcom/cisco/anyconnect/ui/Launcher;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_33
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 23
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 19
    invoke-super/range {p0 .. p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    invoke-virtual/range {p0 .. p0}, Lcom/cisco/anyconnect/ui/Launcher;->getIntent()Landroid/content/Intent;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    .line 22
    .local v6, "bundle":Landroid/os/Bundle;
    if-eqz v6, :cond_15d

    .line 24
    const-string v17, "Launch"

    const/16 v18, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 25
    .local v3, "Launch":Z
    if-eqz v3, :cond_60

    .line 26
    invoke-direct/range {p0 .. p0}, Lcom/cisco/anyconnect/ui/Launcher;->reqPers()V

    .line 28
    const-string v17, "UserPreferences"

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/cisco/anyconnect/ui/Launcher;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    .line 29
    .local v10, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v17, "eula"

    const/16 v18, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 30
    const-string v17, "BlockUntrustedServers"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 31
    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 33
    new-instance v12, Landroid/content/Intent;

    const-class v17, Lcom/cisco/anyconnect/ui/PrimaryActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v12, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 34
    .local v12, "intent":Landroid/content/Intent;
    const/high16 v17, 0x10000000

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 35
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/cisco/anyconnect/ui/Launcher;->startActivity(Landroid/content/Intent;)V

    .line 38
    .end local v10    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v12    # "intent":Landroid/content/Intent;
    :cond_60
    const-string v17, "isStart"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v15

    .line 39
    .local v15, "isStart":Z
    const-string v17, "isActionSwitch"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    .line 41
    .local v13, "isActionSwitch":Z
    if-eqz v15, :cond_107

    if-eqz v13, :cond_107

    if-eqz v3, :cond_107

    .line 42
    invoke-static {}, Lcom/cisco/anyconnect/dynamic/data/Static;->getGlobalData()Lcom/cisco/anyconnect/dynamic/data/Global;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/cisco/anyconnect/dynamic/data/Global;->getMainApplication()Landroid/content/Context;

    move-result-object v17

    if-nez v17, :cond_9a

    .line 43
    const-string v17, ":( null"

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 88
    .end local v3    # "Launch":Z
    .end local v13    # "isActionSwitch":Z
    .end local v15    # "isStart":Z
    :goto_99
    return-void

    .line 47
    .restart local v3    # "Launch":Z
    .restart local v13    # "isActionSwitch":Z
    .restart local v15    # "isStart":Z
    :cond_9a
    invoke-static {}, Lcom/cisco/anyconnect/dynamic/data/Static;->getGlobalData()Lcom/cisco/anyconnect/dynamic/data/Global;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/cisco/anyconnect/dynamic/data/Global;->getMainApplication()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    .line 51
    .local v4, "activity":Landroid/app/Activity;
    :try_start_a4
    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const-string v18, "vpn_switch"

    const-string v19, "id"

    const-string v20, "com.cisco.anyconnect.vpn.android.avf"

    invoke-virtual/range {v17 .. v20}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    .line 54
    .local v8, "buttonId":I
    if-eqz v8, :cond_138

    .line 56
    const-string v17, ":D 1"

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 58
    invoke-virtual {v4, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/google/android/material/switchmaterial/SwitchMaterial;

    .line 60
    .local v7, "button":Lcom/google/android/material/switchmaterial/SwitchMaterial;
    const-string v17, ":D !!"

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 62
    invoke-virtual {v7}, Lcom/google/android/material/switchmaterial/SwitchMaterial;->performContextClick()Z

    move-result v5

    .line 63
    .local v5, "b":Z
    const-string v17, ":D c1!!"

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 64
    if-nez v5, :cond_107

    .line 65
    invoke-virtual {v7}, Lcom/google/android/material/switchmaterial/SwitchMaterial;->performClick()Z

    .line 66
    const-string v17, ":D c2!!"

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V
    :try_end_107
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_107} :catch_14a

    .line 79
    .end local v4    # "activity":Landroid/app/Activity;
    .end local v5    # "b":Z
    .end local v7    # "button":Lcom/google/android/material/switchmaterial/SwitchMaterial;
    .end local v8    # "buttonId":I
    :cond_107
    :goto_107
    const-string v17, "isChangeServer"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    .line 80
    .local v14, "isChangeServer":Z
    const-string v17, "hostName"

    const-string v18, "50"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 81
    .local v11, "hostName":Ljava/lang/String;
    const-string v17, "userName"

    const-string v18, "null"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 82
    .local v16, "userName":Ljava/lang/String;
    const-string v17, "PassWord"

    const-string v18, "null"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_99

    .line 70
    .end local v11    # "hostName":Ljava/lang/String;
    .end local v14    # "isChangeServer":Z
    .end local v16    # "userName":Ljava/lang/String;
    .restart local v4    # "activity":Landroid/app/Activity;
    .restart local v8    # "buttonId":I
    :cond_138
    :try_start_138
    const-string v17, ":(( !!"

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V
    :try_end_149
    .catch Ljava/lang/Exception; {:try_start_138 .. :try_end_149} :catch_14a

    goto :goto_107

    .line 73
    .end local v8    # "buttonId":I
    :catch_14a
    move-exception v9

    .line 74
    .local v9, "e":Ljava/lang/Exception;
    const-string v17, ":(("

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    goto :goto_107

    .line 85
    .end local v3    # "Launch":Z
    .end local v4    # "activity":Landroid/app/Activity;
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v13    # "isActionSwitch":Z
    .end local v15    # "isStart":Z
    :cond_15d
    const-string v17, "Hi ??"

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    goto/16 :goto_99
.end method
