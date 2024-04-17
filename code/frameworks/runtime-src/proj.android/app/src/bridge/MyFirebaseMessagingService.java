package bridge;

import android.annotation.SuppressLint;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;
import com.util.FirebaseUtils;


public class MyFirebaseMessagingService extends FirebaseMessagingService {
    private final String TAG = "MyFirebaseMessagingService";

    @SuppressLint("LongLogTag")
    @Override
    public void onNewToken(@NonNull String token) {
        Log.i(TAG, "生成了新的推送令牌=" + token);
        FirebaseUtils.getInstance().setPushToken(token);
    }

    @SuppressLint("LongLogTag")
    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {

        // TODO(developer): Handle FCM messages here.
        // Not getting messages here? See why this may be: https://goo.gl/39bRNJ
        Log.d(TAG, "推送消息 From: " + remoteMessage.getFrom());

        // Check if message contains a data payload.
        if (remoteMessage.getData().size() > 0) {
            Log.d(TAG, "推送消息 payload: " + remoteMessage.getData());

            //            if (/* Check if data needs to be processed by long running job */ true) {
            //                // For long-running tasks (10 seconds or more) use WorkManager.
            //                scheduleJob();
            //            } else {
            //                // Handle message within 10 seconds
            //                handleNow();
            //            }

        }

        // Check if message contains a notification payload.
        if (remoteMessage.getNotification() != null) {
            Log.d(TAG, "推送消息 Body: " + remoteMessage.getNotification().getBody());
        }
    }
}


