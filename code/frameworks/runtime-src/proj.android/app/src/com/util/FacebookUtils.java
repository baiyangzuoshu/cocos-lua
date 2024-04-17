package com.util;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

import com.facebook.AccessToken;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.login.LoginManager;
import com.facebook.login.LoginResult;
import com.facebook.share.model.ShareLinkContent;
import com.facebook.share.widget.ShareDialog;
import com.google.android.gms.common.api.CommonStatusCodes;
import com.google.gson.Gson;

import org.cocos2dx.lua.AppActivity;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import bridge.AppController;


public class FacebookUtils {
    private static FacebookUtils instance = null;

    private final String TAG = "FacebookUtils";

    private final Gson gson = new Gson();

    private CallbackManager callbackManager;

    private ShareDialog shareDialog;

    private int mLoginCallbackLua = -1;

    public FacebookUtils() {
    }

    public static FacebookUtils getInstance() {
        if (instance == null) {
            instance = new FacebookUtils();
        }

        return instance;
    }

    public void initSdk() {

        callbackManager = CallbackManager.Factory.create();

        LoginManager.getInstance().registerCallback(callbackManager, new FacebookCallback<LoginResult>() {
            public void onSuccess(LoginResult result) {
                AccessToken accessToken = AccessToken.getCurrentAccessToken();
                onLoginSuccess(accessToken);
            }

            public void onCancel() {
                Map<String, Object> map = new HashMap<>();
                map.put("statusCode", CommonStatusCodes.CANCELED);
                String jsonString = gson.toJson(map);

            }

            public void onError(FacebookException error) {
                Map<String, Object> map = new HashMap<>();
                map.put("statusCode", CommonStatusCodes.ERROR);
                map.put("statusMsg", error.getLocalizedMessage());
                map.put("errorData", error);
                String jsonString = gson.toJson(map);

            }

        });

//        shareDialog = new ShareDialog(AppActivity.getInstance());
//        shareDialog.registerCallback(callbackManager, new FacebookCallback<Sharer.Result>() {
//
//            public void onSuccess(Sharer.Result result) {
//                Log.i(TAG, "FB分享成功=" + result.toString());
//                Toast.makeText(AppActivity.getInstance(), "分享成功!", Toast.LENGTH_SHORT).show();
//                nativeOnFacebookShareSuccess();
//            }
//
//            public void onCancel() {
//                Log.i(TAG, "FB分享取消");
//                Toast.makeText(AppActivity.getInstance(), "分享取消!", Toast.LENGTH_SHORT).show();
//            }
//
//            public void onError(FacebookException error) {
//                Log.e(TAG, "FB分享错误");
//                Log.e(TAG, "错误=" + error);
//                nativeOnFacebookShareFailed();
//            }
//
//        });
    }

    public void login() {


        AccessToken accessToken = AccessToken.getCurrentAccessToken();

        if (accessToken != null && !accessToken.isExpired()) {
            onLoginSuccess(accessToken);
        } else {
            LoginManager.getInstance().logInWithReadPermissions(AppActivity.getInstance(), Arrays.asList( "gaming_user_picture", "gaming_profile", "email"));
        }
    }

    public void logout() {
        LoginManager.getInstance().logOut();
    }

    public void share(String shareInfoStr) {
        Log.i(TAG, "拉起分享=" + shareInfoStr);

        FBShareInfo shareInfo = gson.fromJson(shareInfoStr, FBShareInfo.class);

        if (ShareDialog.canShow(ShareLinkContent.class)) {
            Log.i(TAG, "拉起分享界面成功");
            Log.i(TAG, Uri.parse(shareInfo.url).toString());

            ShareLinkContent content = new ShareLinkContent.Builder().setContentUrl(Uri.parse(shareInfo.url)).build();

            shareDialog.show(content);
        }
    }

    private void onLoginSuccess(AccessToken accessToken) {
        String openid = accessToken.getUserId();
        String token = accessToken.getToken();

        Map<String, Object> map = new HashMap<>();
        map.put("statusCode", CommonStatusCodes.SUCCESS);
        map.put("openid", openid);
        map.put("token", token);
        String jsonString = gson.toJson(map);
        Log.d(TAG, "onLoginSuccess: " + jsonString);
        AppController.notifyResultToLua(Constant.OP_CODE_FACEBOOKLOGIN_REDULT, Constant.RESULT_OK, jsonString);

    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        callbackManager.onActivityResult(requestCode, resultCode, data);
    }


    private class FBShareInfo {
        String url;
        String title;
        String image;
        String content;
    }
}
