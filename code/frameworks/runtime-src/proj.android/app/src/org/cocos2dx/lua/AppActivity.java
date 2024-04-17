/****************************************************************************
 Copyright (c) 2008-2010 Ricardo Quesada
 Copyright (c) 2010-2016 cocos2d-x.org
 Copyright (c) 2013-2016 Chukong Technologies Inc.
 Copyright (c) 2017-2018 Xiamen Yaji Software Co., Ltd.

 http://www.cocos2d-x.org

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

package org.cocos2dx.lua;

import android.Manifest;


import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.view.WindowManager;


import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;

import com.linecorp.linesdk.auth.LineLoginApi;
import com.linecorp.linesdk.auth.LineLoginResult;
import com.util.AppsFlyerUtils;
import com.util.ChannelUtils;
import com.util.Constant;
import com.util.FacebookUtils;
import com.util.FirebaseUtils;
import com.util.GoogleplayManager;
import com.util.LineLogin;

import org.cocos2dx.lib.Cocos2dxActivity;


import java.util.ArrayList;
import java.util.List;



import bridge.AppController;
import io.agora.rtc.internal.RtcEngineImpl;

public class AppActivity extends Cocos2dxActivity{


    private static AppActivity sInstance;

    static {
        RtcEngineImpl.initializeNativeLibs();
    }
    private final static int REQUEST_CODE = 200;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.setEnableVirtualButton(false);
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON, WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        //handleSSLHandshake();

//        // Workaround in https://stackoverflow.com/questions/16283079/re-launch-of-activity-on-home-button-but-only-the-first-time/16447508
//        if (!isTaskRoot()) {
//            // Android launched another instance of the root activity into an existing task
//            //  so just quietly finish and go away, dropping the user back into the activity
//            //  at the top of the stack (ie: the last state of this task)
//            // Don't need to finish it again since it's finished in super.onCreate .
//            return;
//        }

        // DO OTHER INITIALIZATION BELOW
        sInstance = this;

        if (ChannelUtils.isSupportAppsFlyer()) {
            AppsFlyerUtils.getInstance().onCreate();
        }
        this.initThirdSDK();
        FacebookUtils.getInstance().initSdk();
        FirebaseUtils.getInstance().initSdk();
        //FirebaseUtils.getInstance().getToken();

    }
    @Override
    protected void onStart() {
        super.onStart();

    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode,resultCode,data);
        //if(requestCode == AppConfig.CAMERA_SCAN_QRCODE_REQUEST && resultCode == RESULT_OK && data != null){
            GoogleplayManager.getInstance().onActivityResult(requestCode,resultCode,data);

        FacebookUtils.getInstance().onActivityResult(requestCode, resultCode, data);
        //}
        if(requestCode == 1007){
            LineLoginResult result = LineLoginApi.getLoginResultFromIntent(data);
            LineLogin.getInstance().handleLineInResult(result);
        }

    }
    public void getRequestAppPermission(){
        // App 运行时确认麦克风的使用权限。
        String[] needPermissions = {Manifest.permission.RECORD_AUDIO};
        checkAndRequestAppPermission(this, needPermissions);

    }
//    public static void handleSSLHandshake() {
//        try {
//            TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager() {
//                public X509Certificate[] getAcceptedIssuers() {
//                    return new X509Certificate[0];
//                }
//
//                @Override
//                public void checkClientTrusted(X509Certificate[] certs, String authType) {
//                }
//
//                @Override
//                public void checkServerTrusted(X509Certificate[] certs, String authType) {
//                }
//            }};
//
//            SSLContext sc = SSLContext.getInstance("TLS");
//            // trustAllCerts信任所有的证书
//            sc.init(null, trustAllCerts, new SecureRandom());
//            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
//            HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier() {
//                @Override
//                public boolean verify(String hostname, SSLSession session) {
//                    return true;
//                }
//            });
//        } catch (Exception ignored) {
//        }
//    }


    private void checkAndRequestAppPermission(@NonNull Activity activity, String[] permissions) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return;
        List<String> permissionList = new ArrayList<>();
        for (String permission : permissions) {
            if (ContextCompat.checkSelfPermission(activity, permission) != PackageManager.PERMISSION_GRANTED) {
//                if (shouldShowRequestPermissionRationale(permission)==false){
//                    AppController.notifyResultToLua(Constant.OP_CODE_GETRECORD_AUDIO_CLOSE, Constant.RESULT_OK, "");
//                }
//                else
//                {
                    permissionList.add(permission);
               // }

            }
            else
            {

            }
        }
        if (permissionList.size() == 0) return;
        String[] requestPermissions = permissionList.toArray(new String[0]);
        activity.requestPermissions(requestPermissions, AppActivity.REQUEST_CODE);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        if (requestCode == REQUEST_CODE) {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < grantResults.length; i++) {
                if (grantResults[i] != PackageManager.PERMISSION_GRANTED) {
                    builder.append(permissions[i]);
                    builder.append(" ");
                }
                else
                {
                    if (permissions[i].indexOf("RECORD_AUDIO")!=-1){
                        AppController.notifyResultToLua(Constant.OP_CODE_GETRECORD_AUDIO_OPEN, Constant.RESULT_OK, "");
                    }
                }
            }
            if (builder.length() > 0) {
                AppController.notifyResultToLua(Constant.OP_CODE_GETRECORD_AUDIO_CLOSE, Constant.RESULT_OK, "");
//                builder.append("not permitted!");
//                Toast.makeText(this, builder.toString(), Toast.LENGTH_SHORT).show();
            }
        } else {
            super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

        sInstance = null;
    }

    private void initThirdSDK() {

        GoogleplayManager.init();

    }

    public static AppActivity getInstance() {
        return sInstance;
    }
}
