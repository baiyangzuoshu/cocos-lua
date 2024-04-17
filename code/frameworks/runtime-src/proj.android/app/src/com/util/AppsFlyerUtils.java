package com.util;

import android.util.Log;

import androidx.annotation.NonNull;

import com.appsflyer.AppsFlyerConversionListener;
import com.appsflyer.AppsFlyerLib;
import com.appsflyer.AppsFlyerProperties;
import com.appsflyer.attribution.AppsFlyerRequestListener;

import org.cocos2dx.lua.AppActivity;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class AppsFlyerUtils {
    private static AppsFlyerUtils instance = null;

    private final String TAG = "AppsFlyerUtils";
    private final AppsFlyerConversionListener conversionListener = new AppsFlyerConversionListener() {

        @Override
        public void onConversionDataSuccess(Map<String, Object> map) {
            for (String attrName : map.keySet())
                Log.d(TAG, "Conversion attribute:" + attrName + " = " + map.get(attrName));
//            String status = Objects.requireNonNull(map.get("af_status"));
//            if (status.equals("Organic")) {
            // Business logic for Organic conversion goes here.
//            } else {
            // Business logic for Non-organic conversion goes here.
//            }
        }

        @Override
        public void onConversionDataFail(String s) {
            Log.d(TAG, "error getting conversion data:" + s);
        }

        @Override
        public void onAppOpenAttribution(Map<String, String> attributionData) {
            Log.d(TAG, "onAppOpenAttribution:" + attributionData);
        }

        @Override
        public void onAttributionFailure(String errorMessage) {
            Log.e(TAG, "onAttributionFailure:" + errorMessage);
        }

    };

    public static AppsFlyerUtils getInstance() {
        if (instance == null) {
            instance = new AppsFlyerUtils();
        }

        return instance;
    }

    public void onCreate() {
        Log.i(TAG, "AFSDK初始化:" + ChannelUtils.AFDevKey);
        AppsFlyerLib.getInstance().init(ChannelUtils.AFDevKey, conversionListener, AppActivity.getInstance().getApplicationContext());
//        AppsFlyerLib.getInstance().setDebugLog(true);
    }

    public void onStart() {
        AppsFlyerLib.getInstance().start(AppActivity.getInstance());
    }

    public void setCustomerID(String id) {
        if (!ChannelUtils.isSupportAppsFlyer()) {
            return;
        }
        if(null== AppsFlyerProperties.getInstance().getString(AppsFlyerProperties.APP_USER_ID))
        {
            Log.i(TAG, "设置自定义用户ID:" + id);
            AppsFlyerLib.getInstance().setCustomerUserId(id);
            AppsFlyerLib.getInstance().start(AppActivity.getInstance());
        }
    }

    public void logEvent(String trackInfoStr) {
        if (!ChannelUtils.isSupportAppsFlyer()) {
            return;
        }

        Log.i(TAG, "AF事件统计字符串=");
        Log.i(TAG, trackInfoStr);

        try {
            JSONObject js = new JSONObject(trackInfoStr);
            String eventName = js.getString("eventName");
            JSONArray values = js.getJSONArray("values");

            Map<String, Object> eventValues = new HashMap<String, Object>();

            for (int i = 0; i < values.length(); i++) {
                JSONObject obj = values.getJSONObject(i);

                String key = obj.getString("key");
                String type = obj.getString("type");

                switch (type) {
                    case "string":
                        eventValues.put(key, obj.getString("value"));
                        break;
                    case "int":
                        eventValues.put(key, obj.getInt("value"));
                        break;
                    case "float":
                        eventValues.put(key, obj.getDouble("value"));
                        break;
                    case "boolean":
                        eventValues.put(key, obj.getBoolean("value"));
                        break;
                    case "unixtime":
                        eventValues.put(key, obj.getLong("value"));
                        break;
                }
            }

            AppsFlyerLib.getInstance().logEvent(AppActivity.getInstance().getApplicationContext(), eventName, eventValues,
                    new AppsFlyerRequestListener() {
                        @Override
                        public void onSuccess() {
                            Log.d(TAG, "AF Event sent successfully");
                        }

                        @Override
                        public void onError(int i, @NonNull String s) {
                            Log.d(TAG, "AF Event failed to be sent:\n" +
                                    "Error code: " + i + "\n"
                                    + "Error description: " + s);
                        }
                    });

            //public static final java.lang.String LEVEL = "af_level";
            //public static final java.lang.String SCORE = "af_score";
            //public static final java.lang.String SUCCESS = "af_success";
            //public static final java.lang.String PRICE = "af_price";
            //public static final java.lang.String REGSITRATION_METHOD = "af_registration_method";
            //public static final java.lang.String PAYMENT_INFO_AVAILIBLE = "af_payment_info_available";
            //public static final java.lang.String MAX_RATING_VALUE = "af_max_rating_value";
            //public static final java.lang.String RATING_VALUE = "af_rating_value";
            //public static final java.lang.String SEARCH_STRING = "af_search_string";
            //public static final java.lang.String DATE_A = "af_date_a";
            //public static final java.lang.String DATE_B = "af_date_b";
            //public static final java.lang.String DESTINATION_A = "af_destination_a";
            //public static final java.lang.String DESTINATION_B = "af_destination_b";
            //public static final java.lang.String DESCRIPTION = "af_description";
            //public static final java.lang.String CLASS = "af_class";
            //public static final java.lang.String EVENT_START = "af_event_start";
            //public static final java.lang.String EVENT_END = "af_event_end";
            //public static final java.lang.String LATITUDE = "af_lat";
            //public static final java.lang.String LONGTITUDE = "af_long";
            //public static final java.lang.String CUSTOMER_USER_ID = "af_customer_user_id";
            //public static final java.lang.String VALIDATED = "af_validated";
            //public static final java.lang.String REVENUE = "af_revenue";
            //public static final java.lang.String RECEIPT_ID = "af_receipt_id";
            //public static final java.lang.String PARAM_1 = "af_param_1";
            //public static final java.lang.String PARAM_2 = "af_param_2";
            //public static final java.lang.String PARAM_3 = "af_param_3";
            //public static final java.lang.String PARAM_4 = "af_param_4";
            //public static final java.lang.String PARAM_5 = "af_param_5";
            //public static final java.lang.String PARAM_6 = "af_param_6";
            //public static final java.lang.String PARAM_7 = "af_param_7";
            //public static final java.lang.String PARAM_8 = "af_param_8";
            //public static final java.lang.String PARAM_9 = "af_param_9";
            //public static final java.lang.String PARAM_10 = "af_param_10";
        } catch (Exception ignored) {
            Log.e(TAG, "解析AF json数据出错");
        }
    }
}