package bridge;

import android.Manifest;
import android.app.Activity;
import android.app.Service;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Vibrator;
import android.util.Log;

import androidx.core.content.ContextCompat;

import com.google.gson.Gson;
import com.util.AppsFlyerUtils;
import com.util.ChannelUtils;
import com.util.Constant;
import com.util.FacebookUtils;
import com.util.FirebaseUtils;
import com.util.GoogleplayManager;
import com.util.LineLogin;
import com.util.Statistics;
import com.yunio.statics.StaticsAgent;
import com.yunio.statics.utils.DeviceUtil;

import org.cocos2dx.lib.Cocos2dxActivity;
import org.cocos2dx.lib.Cocos2dxLuaJavaBridge;
import org.cocos2dx.lua.AppActivity;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import static com.util.Constant.OP_CODE_GOOGLELOGIN_RESULT;
import static com.util.Constant.RESULT_OK;
import static com.util.Constant.OP_CODE_LINELOGIN_RESULT;

public class AppController {
    private static final String TAG = "AppController";

    private static final int GOOGLE_LOGIN_OPCODE = 1001;


    private static  int mLuaLoginCallBack;
    public static String getMetaData(String key) {
        String value = "";

        try {
            ApplicationInfo appInfo = AppActivity.getInstance().getPackageManager().getApplicationInfo(AppActivity.getInstance().getPackageName(),
                    PackageManager.GET_META_DATA);
            value = appInfo.metaData.get(key).toString();
        } catch (Exception e) {
            value = "";
        }

        return value;
    }
    public static void gpQueryProducts(String queryInfoStr) throws JSONException {
        List<String> skuList = new ArrayList<String> ();
        Log.d(TAG,queryInfoStr.toString());
        JSONArray array = new JSONArray(queryInfoStr);
        for (int i = 0; i < array.length(); i++) {
            String productId = array.getString(i);
//            skuList.add(array.getJSONObject(i).getString("product_id"));
            Log.d(TAG, "------gpQueryProducts productId: " + productId);
            skuList.add(productId);
        }

        GoogleplayManager.getInstance().queryProducts(skuList);
    }
    public static void vibrate() {
        AppActivity.getInstance().runOnUiThread(() -> {
            Vibrator v = (Vibrator) AppActivity.getInstance().getSystemService(Service.VIBRATOR_SERVICE);
            v.vibrate(500);
        });
    }
    public static void getRequestAppPermission(){
        AppActivity.getInstance().getRequestAppPermission();
    }

    public static int isRequestAppPermission(){
        if (ContextCompat.checkSelfPermission(AppActivity.getInstance(), Manifest.permission.RECORD_AUDIO) == PackageManager.PERMISSION_GRANTED){
            return 1;
        }
        return 0;
    };
    public static void gpReplenishmentOrder(){
        GoogleplayManager.getInstance().replenishmentOrder();
    }
    public static void googleLogin(){
        Log.d(TAG, "googleLogin");
        GoogleplayManager.getInstance().login();
        //mLuaLoginCallBack=luaCallback;
    }
    public static void gpConsumePurchase(String purchaseToken) {
        GoogleplayManager.getInstance().handlePurchase(purchaseToken);
    }
    public static void AFSetCustomerUserID(String id) {
        AppsFlyerUtils.getInstance().setCustomerID(id);
    }

    public static void AFTrackEvent(String trackInfoStr) {
        AppsFlyerUtils.getInstance().logEvent(trackInfoStr);
    }
    public static void facebookLogin(){
        FacebookUtils.getInstance().login();
    }

    public static void googlePay(String payInfoStr)
    {
        Gson gson = new Gson();
        //Product_Info shareInfo = gson.fromJson(payInfoStr, Product_Info.class);
        GoogleplayManager.getInstance().pay(payInfoStr);

        Log.d(TAG, "-------------googlePay---------" + payInfoStr);
//        callLuaFunc(OP_CODE_GOOGLE_PAY_RESULT, "TEST FOR GOOGLE PAY");
  //      notifyResultToLua(Constant.OP_CODE_PAY_RESULT, Constant.RESULT_OK, "TEST FOR GOOGLE PAY");
    }

    public static void initTFDataManager(String data) {
        AppActivity.getInstance().runOnUiThread(() -> Statistics.getInstance().initTFDataManager(data));
        //AppActivity.getInstance().runOnUiThread(() -> com.yunio.games.boastsieve.utils.Statistics.getInstance().init(appKey,"2"));
    }



    public static String getTFDeviceId() {
        return StaticsAgent.getDeviceId();
    }

    public static void uploadTFUserData(String data) {
        Statistics.getInstance().uploadUserData(data);
    }

    public static void onTFEventCode(String jsonstr) {
        Statistics.getInstance().onEvent(jsonstr);
    }

    public static void copyToClipboard(String text)
    {
        final String _text = text;
        try
        {
            //Log.d("cocos2dx","copyToClipboard " + text);


            Runnable runnable = new Runnable() {
                public void run() {
                    Gson gson = new Gson();
                    CopyData shareInfo = gson.fromJson(_text, CopyData.class);
                    Log.d(TAG, "-------------shareInfo---------" + shareInfo.text);
                    android.content.ClipboardManager clipboard = (android.content.ClipboardManager) AppActivity.getInstance().getContext().getSystemService(Context.CLIPBOARD_SERVICE);
                    android.content.ClipData clip = android.content.ClipData.newPlainText("Copied Text", shareInfo.text);
                    clipboard.setPrimaryClip(clip);
                }
            };
            //getSystemService运行所在线程必须执行过Looper.prepare()
            //否则会出现Can't create handler inside thread that has not called Looper.prepare()
            ((Activity)AppActivity.getInstance()).runOnUiThread(runnable);

        }catch(Exception e){
            // Log.d("cocos2dx","copyToClipboard error");
            e.printStackTrace();

        }
    }
    public static int getFringeScreenTop(){
        int resID = AppActivity.getInstance().getResources().getIdentifier("status_bar_height", "dimen", "android");
        if (resID > 0){
            return AppActivity.getInstance().getResources().getDimensionPixelSize(resID);
        }
        return 0;
    }
    public static  void googleLoginBack(String token){
        callLuaFunc(OP_CODE_GOOGLELOGIN_RESULT,RESULT_OK,token);
    }

    public static void notifyResultToLua(int opcode, int resultCode, String data) {
        callLuaFunc(opcode, resultCode, data);
    }
    public static String getVersion() {
        String versionName = "1.0";

        try {
            PackageManager pm = AppActivity.getInstance().getPackageManager();
            PackageInfo pi = pm.getPackageInfo(AppActivity.getInstance().getPackageName(), 0);
            versionName = pi.versionName;

            if (versionName == null || versionName.length() <= 0) {
                versionName = "1.0.0";
            }
        } catch (Exception e) {
            versionName = "1.0.0";
        }

        return versionName;
    }
    public static String getAppPushToken() {
        return FirebaseUtils.getInstance().getPushToken();
    }
    public static void FirebaseSetUserId(String id) {
        FirebaseUtils.getInstance().setUserId(id);
    }

    public static void FirebaseLogEvent(String trackInfoStr) {
        FirebaseUtils.getInstance().logEvent(trackInfoStr);
    }

    public static void lineLogin() {
        LineLogin.getInstance().loginLine();
    }

    public static void lineLoginBack(String value) {
       callLuaFunc(OP_CODE_LINELOGIN_RESULT,1,value);
    }

    public static void lineLogout() {
        LineLogin.getInstance().logout();
    }

    private static native void callLuaFunc(int opcode, int resultCode, String data);

//    public static native int callLuaFunctionWithString(int luaFunctionId, String value);  // 调用局部Lua-Function
//    public static native int callLuaGlobalFunctionWithString(String luaFunctionName, String value); // 调用全局Lua-Function
//    public static native int retainLuaFunction(int luaFunctionId); // retain一次Lua-Function
//    public static native int releaseLuaFunction(int luaFunctionId); // release掉Lua-Function
    class CopyData{
        public  String text;
        public String getText(){return text;};
    }

//    class Product_Info
//    {
//        public String product_Id;
//        public String getProductId(){return product_Id;};
//    }
}