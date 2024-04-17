package com.util;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.util.Log;

import com.google.android.gms.common.api.CommonStatusCodes;
import com.google.gson.Gson;
import com.linecorp.linesdk.LineProfile;
import com.linecorp.linesdk.Scope;
import com.linecorp.linesdk.api.LineApiClient;
import com.linecorp.linesdk.api.LineApiClientBuilder;
import com.linecorp.linesdk.auth.LineAuthenticationParams;
import com.linecorp.linesdk.auth.LineLoginApi;
import com.linecorp.linesdk.auth.LineLoginResult;

import org.cocos2dx.lib.Cocos2dxLuaJavaBridge;
import org.cocos2dx.lua.AppActivity;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import bridge.AppController;


public class LineLogin {
    private static final String TAG = "Linelogin";
    private static LineLogin instance = null;
    private static LineApiClient lineApiClient;
    private static final int REQUEST_CODE = 1007;
    private final Gson gson = new Gson();

    public static LineLogin getInstance() {
        if (instance == null) {
            instance = new LineLogin();
        }

        return instance;
    }

    //line初始化
    public static LineApiClient getLineApiClient(Context context) {
        if (lineApiClient == null) {
            synchronized (LineLogin.class) {
                if (lineApiClient == null) {
                    LineApiClientBuilder apiClientBuilder = new LineApiClientBuilder(context,"1657241132");
                    lineApiClient = apiClientBuilder.build();
                }
            }
        }
        return lineApiClient;
    }


    //line登陆
    public void loginLine() {
        Log.e("TAG", "loginLine: 登陆");

        AsyncTask.THREAD_POOL_EXECUTOR.execute(() -> {
            try {
                // 检测token有效性
                if (getLineApiClient(AppActivity.getInstance()).verifyToken().isSuccess()) {
                    String accessToken = getLineApiClient(AppActivity.getInstance()).getCurrentAccessToken().getResponseData().getTokenString();
                    LineProfile profile = getLineApiClient(AppActivity.getInstance()).getProfile().getResponseData();
                    String userId = profile.getUserId();
                    Log.e("TAG", "loginLine: 登陆 accessToken:" +accessToken +"userId:"+userId );

                    Map<String, Object> map = new HashMap<>();
                    map.put("statusCode", CommonStatusCodes.SUCCESS);
                    map.put("openid", userId);
                    map.put("token", accessToken);
                    String jsonString = gson.toJson(map);
                    toLua(jsonString);
                    //TODO 获取token和userId，执行自己的登录业务逻辑

                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try{
                Log.e("TAG", "loginLine:授权登录"  );
                // 调起line app授权登录
                LineAuthenticationParams params = new LineAuthenticationParams.Builder().scopes(Arrays.asList(Scope.PROFILE)).build();
                Intent loginIntent = LineLoginApi.getLoginIntent(AppActivity.getInstance(), "1657241132", params);
                AppActivity.getInstance().startActivityForResult(loginIntent, REQUEST_CODE);
            } catch(Exception e) {
                e.printStackTrace();
            }

        });
    }


    //line 回调
     public void  handleLineInResult(LineLoginResult result) {
        Log.e("TAG", "handleLineInResult:result:" +result.getResponseCode());
        switch (result.getResponseCode()) {
            case SUCCESS:
                try {
                    String accessToken = result.getLineCredential().getAccessToken().getTokenString();
                    String userId = result.getLineProfile().getUserId();
                    String displayName = result.getLineProfile().getDisplayName();

                    Log.e("TAG", "handleLineInResult: 登陆 accessToken:" +accessToken +"userId:"+userId  );

                    //TODO 获取token和userId，执行自己的登录业务逻辑
                    Map<String, Object> map = new HashMap<>();
                    map.put("statusCode", CommonStatusCodes.SUCCESS);//0
                    map.put("openid", userId);
                    map.put("token", accessToken);
                    String jsonString = gson.toJson(map);
                    toLua(jsonString);
                } catch (Exception e) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("statusCode", CommonStatusCodes.ERROR);//13
                    map.put("openid", 0);
                    map.put("token", 0);
                    String jsonString = gson.toJson(map);
                    toLua(jsonString);
                    e.printStackTrace();
                }
                break;
            case CANCEL:
                // Login CANCEL!
                Map<String, Object> map = new HashMap<>();
                map.put("statusCode", CommonStatusCodes.CANCELED);//-1
                map.put("openid", 0);
                map.put("token", 0);
                String jsonString = gson.toJson(map);
                toLua(jsonString);
                break;
            default:
                // Login FAILED!
        }
    }

    public void logout()
    {
        lineApiClient.logout();
    }


    private void toLua(String value) {
        AppController.lineLoginBack(value);
    }

}
