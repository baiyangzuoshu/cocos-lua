package com.util;

import android.util.Log;

import com.yunio.statics.StaticsAgent;
import com.yunio.statics.StaticsConfigure;

import org.cocos2dx.lua.AppActivity;
import org.json.JSONObject;


public class Statistics {
    private static Statistics instance = null;


    private static final String TAG = "Statistics";

    public static Statistics getInstance() {
        if (instance == null) {
            instance = new Statistics();
        }

        return instance;
    }

    public void onEvent(String jsonstr) {
        Log.d(TAG, "-------------onEvent---------" + jsonstr);
        try {
            JSONObject js = new JSONObject(jsonstr);
            String eventName = js.optString("eventName");
            double values = js.optDouble("values");
            String extend = js.optString("extend");
            StaticsAgent.onEvent(AppActivity.getInstance(), eventName, values, extend);
        } catch (Exception ignored) {
            Log.e("Statistics", "解析StaticsConfigure json数据出错");
        }
//        try {
//            JSONObject js = new JSONObject(jsonstr);
//            String eventName = js.getString("eventName");
//            Double values = js.getDouble("values");
//            if (values != null) {
//                StaticsAgent.onEvent(AppActivity.getContext(), eventName, values);
//            } else {
//                StaticsAgent.onEvent(AppActivity.getContext(), eventName);
//            }
//        } catch (Exception ignored) {
//            Log.e("TAG", "解析StaticsConfigure json数据出错");
//        }
    }

    public void init(String appkey, String channel) {
        StaticsConfigure.init(AppActivity.getContext(), appkey, channel);
    }

    public void setLogEnabled(boolean enabled) {
        StaticsConfigure.setLogEnabled(enabled);
    }

    public void uploadUserData(String data) {
        StaticsAgent.uploadUserData(data);
    }
    public void initTFDataManager(String data){
        try {
            StaticsConfigure.setLogEnabled(true);
            JSONObject userObj = new JSONObject(data);
            String key = userObj.optString("sppkey");
            String uid = userObj.optString("user_id");
            String deviceId = "";
            if(uid.equals("")){
                StaticsConfigure.init(AppActivity.getInstance(),key,"2");
            }
            else
            {
                StaticsConfigure.init(AppActivity.getInstance(),key,"2",deviceId,uid);
            }
        }catch (Exception var2) {
            var2.printStackTrace();
        }
    }
//     * 数据包含字段（可选字段）
//    area_code 区号
// * mobile 手机号
// * city 城市
// * app_user_id 应用内userId
// * gender 性别
// * other_info 其他信息Json格式）
//    nickname 昵称


}

