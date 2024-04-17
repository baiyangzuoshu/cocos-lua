package com.util;

import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.analytics.FirebaseAnalytics;

import com.google.firebase.installations.FirebaseInstallations;
import com.google.firebase.installations.InstallationTokenResult;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.gson.Gson;

import org.cocos2dx.lua.AppActivity;

public class FirebaseUtils {
    private static FirebaseUtils instance = null;
    private final String TAG = "FirebaseUtils";
    private final Gson gson = new Gson();
    private String appPushToken = "";
    private FirebaseAnalytics mFirebaseAnalytics;

    public static FirebaseUtils getInstance() {
        if (instance == null) {
            instance = new FirebaseUtils();
        }

        return instance;
    }

    public void initSdk() {
        if (ChannelUtils.isSupportFCM()) {
            mFirebaseAnalytics = FirebaseAnalytics.getInstance(AppActivity.getInstance());
            FirebaseMessaging.getInstance().setAutoInitEnabled(true);
            this.getToken();
        }
    }

    public void getToken(){
        FirebaseMessaging.getInstance().getToken()
                .addOnCompleteListener(new OnCompleteListener<String>() {
                    @Override
                    public void onComplete(@NonNull Task<String> task) {
                        if (!task.isSuccessful()) {
                            Log.w(TAG, "Fetching FCM registration token failed", task.getException());
                            return;
                        }

                        appPushToken = task.getResult();
                    }
                });

//        FirebaseInstanceId.getInstance().getInstanceId().addOnSuccessListener(AppActivity.getInstance(),  new OnSuccessListener<InstanceIdResult>() {
//            @Override
//            public void onSuccess(InstanceIdResult instanceIdResult) {
//                String mToken = instanceIdResult.getToken();
//                Log.e("Token",mToken);
//                if (mToken!=""){
//                    FirebaseUtils.getInstance().setPushToken(mToken);
//                }
//            }
//        });
    }

    public void setUserId(String id) {
        Log.i(TAG, "记录ID");
        Log.i(TAG, id);
        mFirebaseAnalytics.setUserId(id);
    }

    public void logEvent(String trackInfoStr) {

        Log.i(TAG, "记录事件");
        Log.i(TAG, trackInfoStr);

        CustomEvent event = gson.fromJson(trackInfoStr, CustomEvent.class);

        Log.i(TAG, "事件=" + event.eventName);

        //记录事件方法 类似map 可套入af
        Bundle bundle = new Bundle();

        for (CustomEvent.EventItem item : event.values)
            bundle.putString(item.key, item.value);
        mFirebaseAnalytics.logEvent(event.eventName, bundle);
    }

    public String getPushToken() {
        Log.i(TAG, "最后读取token=" + appPushToken);
        return appPushToken;
    }

    public void setPushToken(String token) {
        appPushToken = token;
    }

    private class CustomEvent {
        public String eventName;
        public EventItem[] values;

        private class EventItem {
            public String key;
            public String value;
        }
    }
}
