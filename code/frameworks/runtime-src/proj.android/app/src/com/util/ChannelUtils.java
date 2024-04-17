package com.util;

import bridge.AppController;

public class ChannelUtils {
    public static String AFDevKey = "";
    public static String channelId = "";
    private static int supportGoogleplayFlag = 2;
    private static int supportFacebookFlag = 2;
    private static int supportFCMFlag = 2;
    private static int supportAppsFlyerFlag = 2;

    public static String getChannelId() {
        if (channelId.equals("")) {
            channelId = AppController.getMetaData("channel_id");
        }

        return channelId;
    }

    public static boolean isSupportGoogleplay() {
        if (supportGoogleplayFlag == 2) {
            String value = AppController.getMetaData("supportGoogleplayFlag");

            if (value.equals("1")) {
                supportGoogleplayFlag = 1;
            } else {
                supportGoogleplayFlag = 0;
            }
        }

        return (supportGoogleplayFlag == 1);
    }

    public static boolean isSupportFacebook() {
        if (supportFacebookFlag == 2) {
            String value = AppController.getMetaData("com.facebook.sdk.ApplicationId");

            if (value.equals("")) {
                supportFacebookFlag = 0;
            } else {
                supportFacebookFlag = 1;
            }
        }

        return (supportFacebookFlag == 1);
    }

    public static boolean isSupportFCM() {
        if (supportFCMFlag == 2) {
            String value = AppController.getMetaData("supportFCMFlag");

            if (value.equals("1")) {
                supportFCMFlag = 1;
            } else {
                supportFCMFlag = 0;
            }
        }

        return (supportFCMFlag == 1);
    }

    public static boolean isSupportAppsFlyer() {
        if (supportAppsFlyerFlag == 2) {
            AFDevKey = AppController.getMetaData("AFDevKey");

            if (AFDevKey.equals("")) {
                supportAppsFlyerFlag = 0;
            } else {
                supportAppsFlyerFlag = 1;
            }
        }

        return (supportAppsFlyerFlag == 1);
    }
}
