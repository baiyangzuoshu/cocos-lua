package com.util;

import android.app.Activity;
import android.content.Intent;

import android.content.IntentSender;
import android.util.Log;


import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ConsumeParams;
import com.android.billingclient.api.ConsumeResponseListener;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.SkuDetailsParams;
import com.android.billingclient.api.SkuDetailsResponseListener;
import com.android.billingclient.api.BillingClient.BillingResponseCode;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.identity.BeginSignInRequest;
import com.google.android.gms.auth.api.identity.Identity;
import com.google.android.gms.auth.api.identity.SignInClient;
import com.google.android.gms.auth.api.identity.SignInCredential;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInClient;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.CommonStatusCodes;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.tasks.Task;
import com.google.gson.Gson;


import org.cocos2dx.lua.AppActivity;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bridge.AppController;

public class GoogleplayManager implements PurchasesUpdatedListener
{
	private static final String TAG = "GoogleplayManager";
	private static GoogleplayManager instance;

	private static final int STATE_CONNECTING = 1;
	private static final int STATE_CONNECT_SUCCESS = 2;
	private static final int STATE_CONNECT_FAILED = 3;

	private final Gson gson = new Gson();
	private final Map<String, SkuDetails> skuDetailMap = new HashMap<>();

	private BillingClient billingClient;
	private int mConnectState = STATE_CONNECT_FAILED;

	private GoogleSignInClient mGoogleSignInClient=null;
	String clientId = "926884058720-705atrqkqls9j8ctnl38c96k6t6c7u60.apps.googleusercontent.com";
	//String clientId = "926884058720-705atrqkqls9j8ctnl38c96k6t6c7u60.apps.googleusercontent.com";
	private final int REQ_ONE_TAP = 100;  // Can be any integer unique to the Activity.
	private final int REQUEST_CODE_GIS_SAVE_PASSWORD = 2; /* unique request id */
	private SignInClient oneTapClient;
	private BeginSignInRequest signInRequest;



	public static void init() {
		instance = new GoogleplayManager();
	}

	public static GoogleplayManager getInstance() {
		return instance;
	}

	private GoogleplayManager() {
		GoogleSignInOptions gso = new GoogleSignInOptions
				.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
				.requestIdToken(clientId)
				.requestEmail()
				.build();
//		mGoogleApiClient = new GoogleApiClient.Builder(AppActivity.getInstance())
//				.addApi(Auth.GOOGLE_SIGN_IN_API, gso)
//				.addConnectionCallbacks(this)
//				.addOnConnectionFailedListener(this)
//				.build();
		this.mGoogleSignInClient = GoogleSignIn.getClient(AppActivity.getInstance(), gso);
//		GoogleSignInOptions gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
//				//.requestEmail()
//				.requestIdToken(clientId)
//				.build();
//		this.mGoogleSignInClient = GoogleSignIn.getClient(AppActivity.getInstance(), gso);

		//登录前可以查看是否已经授权，已经授权则可不必重复授权，如果返回的额account不为空则已经授权，同理activity为当前activity
		//GoogleSignInAccount account = GoogleSignIn.getLastSignedInAccount(AppActivity.getInstance());
		//如果未授权则可以调用登录，mGoogleSignInClient为初始化好的Google登录实例，RC_SIGN_IN为随意唯一返回标识码，int即可。
//		Intent signInIntent = mGoogleSignInClient.getSignInIntent();
//		startActivityForResult(signInIntent, RC_SIGN_IN);
		//初始化支付实例
		billingClient = BillingClient.newBuilder(AppActivity.getInstance())
				.enablePendingPurchases()
				.setListener(this)
				.build();
		checkToConnectBillingClient();
	}

	public void login(){
		if (mGoogleSignInClient==null){
			GoogleSignInOptions gso = new GoogleSignInOptions
					.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
					.requestIdToken(clientId)
					//.requestEmail()
					.build();
			this.mGoogleSignInClient = GoogleSignIn.getClient(AppActivity.getInstance(), gso);
		}
		Intent signInIntent = mGoogleSignInClient.getSignInIntent();
		AppActivity.getInstance().startActivityForResult(signInIntent, 1000);
//		oneTapClient = Identity.getSignInClient(AppActivity.getInstance());
//		signInRequest = BeginSignInRequest.builder()
//				.setPasswordRequestOptions(BeginSignInRequest.PasswordRequestOptions.builder()
//						.setSupported(true)
//						.build())
//				.setGoogleIdTokenRequestOptions(BeginSignInRequest.GoogleIdTokenRequestOptions.builder()
//						.setSupported(true)
//						// Your server's client ID, not your Android client ID.
//						.setServerClientId(clientId)
//						// true:Only show accounts previously used to sign in. false:Show all accounts on the device.
//						.setFilterByAuthorizedAccounts(false)
//						.build())
//				// Automatically sign in when exactly one credential is retrieved.
//				.setAutoSelectEnabled(true)
//				.build();
//		oneTapClient.beginSignIn(signInRequest).addOnSuccessListener(AppActivity.getInstance(), result -> {
//			try {
//				AppActivity.getInstance().startIntentSenderForResult(result.getPendingIntent().getIntentSender(), REQ_ONE_TAP, null, 0, 0, 0);
//			} catch (IntentSender.SendIntentException e) {
//				Log.e(TAG, "Couldn't start One Tap UI: " + e.getLocalizedMessage());
//			}
//		}).addOnFailureListener(AppActivity.getInstance(), e -> {
//			// No saved credentials found. Launch the One Tap sign-up flow, or
//			// do nothing and continue presenting the signed-out UI.
//			Log.d(TAG, e.toString());
//			Log.d(TAG, e.getLocalizedMessage());
//			AppController.notifyResultToLua(Constant.OP_CODE_GOOGLELOGIN_RESULT, Constant.ERROR_CODE_FAILED, null);
//		});
	}


	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		Log.i(TAG, "返回的Code" + requestCode + " 结果=" + resultCode );
		switch (requestCode) {
			case REQ_ONE_TAP:
				try {
					SignInCredential credential = oneTapClient.getSignInCredentialFromIntent(data);
					Log.i(TAG, "登录成功数据" + credential);
					String idToken = credential.getGoogleIdToken();
					Log.i(TAG, "登录成功数据==idToken==" + idToken);
					String username = credential.getId();
					Log.i(TAG, "登录成功数据==username==" + username);
					String password = credential.getPassword();
					Log.i(TAG, "登录成功数据==password==" + password);

					Map<String, Object> map = new HashMap<>();
					map.put("openid", username);
					if (idToken != null) {
						// Got an ID token from Google. Use it to authenticate
						// with your backend.
						map.put("token", idToken);
					} else if (password != null) {
						// Got a saved username and password. Use them to authenticate
						// with your backend.
						map.put("password", password);
					}
					map.put("statusCode", CommonStatusCodes.SUCCESS);
					Gson gson = new Gson();
					String jsonString = gson.toJson(map);
					AppController.googleLoginBack(idToken);
					//handleSignInResult(task);
				} catch (ApiException e) {
					Log.i(TAG, "登录成功解包出错=====" + e);
					// 用户拒绝了一键登录
					switch (e.getStatusCode()) {
						case CommonStatusCodes.CANCELED:
							Log.d(TAG, "One-tap dialog was closed.");
							// Don't re-prompt the user.

							break;
						case CommonStatusCodes.NETWORK_ERROR:
							Log.d(TAG, "One-tap encountered a network error.");
							// Try again or just ignore.
							break;
						default:
							Log.d(TAG, "Couldn't get credential from result." + e.getLocalizedMessage());
							break;
					}

					AppController.notifyResultToLua(Constant.OP_CODE_GOOGLELOGIN_RESULT, Constant.ERROR_CODE_FAILED, null);
				}
				break;
			case REQUEST_CODE_GIS_SAVE_PASSWORD:
				if (resultCode == Activity.RESULT_OK) {
					/* password was saved */
				} else if (resultCode == Activity.RESULT_CANCELED) {
					/* password saving was cancelled */
				}
				break;
			default:
		}
		if (requestCode == 1000) {
			Task<GoogleSignInAccount> task = GoogleSignIn.getSignedInAccountFromIntent(data);
			handleSignInResult(task);
		}
	}

	private void handleSignInResult(Task<GoogleSignInAccount> completedTask) {
		try {
			GoogleSignInAccount account = completedTask.getResult(ApiException.class);
			AppController.googleLoginBack(account.getIdToken());
			Log.e(TAG, account.getId()+"-" + account.getIdToken()+"-");
		} catch (ApiException e) {
			Log.w(TAG, "signInResult:failed code=" + e.getStatusCode());
			AppController.notifyResultToLua(Constant.OP_CODE_GOOGLELOGIN_RESULT, Constant.ERROR_CODE_FAILED, null);

		}
	}


	private void checkToConnectBillingClient() {
		if (mConnectState != STATE_CONNECT_FAILED) {
			return;
		}
		mConnectState = STATE_CONNECTING;
		billingClient.startConnection(new BillingClientStateListener() {
			@Override
			public void onBillingSetupFinished(BillingResult billingResult) {
				// Logic from ServiceConnection.onServiceConnected should be moved here.
				Log.d(TAG, "onBillingSetupFinished responseCode: " + billingResult.getResponseCode() + ", " + billingResult.getDebugMessage());

				if (billingResult.getResponseCode() == BillingResponseCode.OK) {
					mConnectState = STATE_CONNECT_SUCCESS;
				} else {
					mConnectState = STATE_CONNECT_FAILED;
				}
			}

			@Override
			public void onBillingServiceDisconnected() {
				// Logic from ServiceConnection.onServiceDisconnected should be moved here.
				mConnectState = STATE_CONNECT_FAILED;
			}
		});
	}

	@Override
	public void onPurchasesUpdated(
			@NonNull BillingResult billingResult, @Nullable List<Purchase> purchases) {
		// Logic from onActivityResult should be moved here.
		int responseCode = billingResult.getResponseCode();

		Log.d(TAG, "onPurchasesUpdated responseCode: " + responseCode);

		if (responseCode == BillingResponseCode.OK) {
			this.onPaySuccess(purchases);
		} else {
			// Handle any other error codes.
			Log.d(TAG, "onPurchasesUpdated purchase failed: " + billingResult.getDebugMessage());
			this.handlePayFailed(responseCode, billingResult.getDebugMessage());
		}
	}

//	private void consumePurchase(String purchaseToken) {
//		// Verify the purchase.
//		// Ensure entitlement was not already granted for this purchaseToken.
//		// Grant entitlement to the user.
//
//		ConsumeParams consumeParams =
//				ConsumeParams.newBuilder()
//						.setPurchaseToken(purchaseToken)
//						.build();
//
//		ConsumeResponseListener listener = new ConsumeResponseListener() {
//			@Override
//			public void onConsumeResponse(BillingResult billingResult, String purchaseTokenInner) {
//				if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
//					// Handle the success of the consume operation.
//				}
//			}
//		};
//
//		billingClient.consumeAsync(consumeParams, listener);
//	}

	private boolean isConnected() {
		return mConnectState == STATE_CONNECT_SUCCESS;
	}

	public void queryProducts(List<String> skuList) {
		Log.i(TAG, "queryProducts11111111111111111111111111");
		if (!isConnected()) {
			return;
		}
		Log.i(TAG, "queryProducts22222222222222222222222");
		SkuDetailsParams.Builder params = SkuDetailsParams.newBuilder();
		params.setSkusList(skuList).setType(BillingClient.SkuType.INAPP);
		billingClient.querySkuDetailsAsync(params.build(),
				new SkuDetailsResponseListener() {
					public void onSkuDetailsResponse(BillingResult billingResult,
													 List<SkuDetails> skuDetailsList) {
						// Process the result.
						onQueryProductsArrived(billingResult, skuDetailsList);
					}
				});
	}

	public void pay(String payInfoStr) {
		// An activity reference from which the billing flow will be launched.
		Activity activity = AppActivity.getInstance();

		Log.i(TAG, "唤起支付==" + payInfoStr);

		Product_Info productInfo = gson.fromJson(payInfoStr, Product_Info.class);

		//Product_Info productInfo = .parseObject(payInfoStr, Product_Info.class);


		Log.i(TAG, "Lua支付商品数据==" + gson.toJson(productInfo));

		SkuDetails skuDetails = skuDetailMap.get(productInfo.product_Id);

		Log.i(TAG, "Java支付商品数据==" + gson.toJson(skuDetails));

		// Retrieve a value for "skuDetails" by calling querySkuDetailsAsync().
		BillingFlowParams billingFlowParams = BillingFlowParams.newBuilder()
				.setSkuDetails(skuDetails)
				.build();
		int responseCode = billingClient.launchBillingFlow(activity, billingFlowParams).getResponseCode();

		Log.d(TAG, "pay responseCode: " + responseCode);
		// Handle the result.
		if (responseCode == BillingResponseCode.OK) {
			// 启动支付成功， 等待支付结果 @onPurchasesUpdated
			Log.i(TAG, "启动支付成功， 等待支付结果");
		}
	}

	private void onQueryProductsArrived(BillingResult billingResult,
										List<SkuDetails> skuDetailsList) {

		Log.d(TAG, "onQueryProductsArrived responseCode: " + billingResult.getResponseCode() + ", " + billingResult.getDebugMessage());
		if (billingResult.getResponseCode() == BillingResponseCode.OK) {
			// 启动支付成功， 等待支付结果 @onPurchasesUpdated
			skuDetailMap.clear();
			Map<String, String> skuDetailTmpMap = new HashMap<>();
			if (skuDetailsList != null) {
				for (SkuDetails skuDetails : skuDetailsList) {
					System.out.println(skuDetails.toString());
					skuDetailMap.put(skuDetails.getSku(), skuDetails);
					skuDetailTmpMap.put(skuDetails.getSku(), skuDetails.getPrice());
				}

				String ojsonString = gson.toJson(skuDetailMap);
				Log.i(TAG, "转JSON完给客户端==" + ojsonString);
				String jsonString = gson.toJson(skuDetailTmpMap);
				Log.i(TAG, "转JSON完给客户端==" + jsonString);

				//nativeOnGooglePayQueryProducts(jsonString);
				AppController.notifyResultToLua(Constant.OP_CODE_QUERY_PRODUCTS_RESULT, Constant.RESULT_OK, jsonString.toString());
				this.replenishmentOrder();
			}
		} else {
			AppController.notifyResultToLua(Constant.OP_CODE_QUERY_PRODUCTS_RESULT, Constant.ERROR_CODE_FAILED, null);
		}

	}

	public void onPaySuccess(List<Purchase> purchases) {
		for (Purchase purchase : purchases) {
			//this.handlePurchase(purchase.getPurchaseToken());
			Purchase p = purchase;//purchases.get(0);

//		{purchaseToken = purchaseToken, orderId = orderId, productId = productId}
//		crypto.encodeBase64(data),
			JSONObject object = new JSONObject();
			try {
				Log.d(TAG, "onPurchasesUpdated responseCode: " + p.getOrderId());
				object.put("purchaseToken", p.getPurchaseToken());
				object.put("orderId", p.getOrderId());
				object.put("productId",p.getSkus().get(0));
				object.put("packageName",p.getPackageName());
				//		object.put("productId", p.get);
				Log.d(TAG, "onPurchasesUpdated responseCode: " + p.getSkus());
				AppController.notifyResultToLua(Constant.OP_CODE_PAY_RESULT, Constant.RESULT_OK, object.toString());
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}



	}
//	//补单
//	public void replenishmentOrder() {
//		Log.i(TAG, "查询补货订单");
//		billingClient.queryPurchasesAsync(BillingClient.SkuType.INAPP, purchasesResponseListener);
//	}
	public void handlePayFailed(int responseCode, String debugMessage) {
		int errorCode;
		if (responseCode == BillingResponseCode.USER_CANCELED) {
			// Handle an error caused by a user cancelling the purchase flow.
			Log.d(TAG, "handlePayFailed: user canceled. ");
			errorCode = Constant.ERROR_CODE_USER_CANCELED;
		} else {
			// Handle any other error codes.
			Log.d(TAG, "handlePayFailed purchase failed: " + debugMessage);
			errorCode = Constant.ERROR_CODE_FAILED;
		}
		AppController.notifyResultToLua(Constant.OP_CODE_PAY_RESULT, errorCode, null);
	}

	public void handlePurchase(String purchaseToken) {
		Log.i(TAG, "开始用token核验订单=" + purchaseToken);

		ConsumeParams consumeParams = ConsumeParams.newBuilder().setPurchaseToken(purchaseToken).build();

		ConsumeResponseListener listener = new ConsumeResponseListener() {
			@Override
			public void onConsumeResponse(BillingResult billingResult, @NonNull String purchaseToken) {
				int responseCode = billingResult.getResponseCode();
				if (responseCode == BillingClient.BillingResponseCode.OK) {
					// Handle the success of the consume operation.
					Log.i(TAG, "处理消费操作成功。=" + purchaseToken);
				} else {
					Log.e(TAG, "处理消费操作失败=" + billingResult.getDebugMessage());
					Log.e(TAG, "处理消费操作失败token=" + purchaseToken);
				}

			}
		};

		billingClient.consumeAsync(consumeParams, listener);
	}
	public void replenishmentOrder() {
		Purchase.PurchasesResult result = billingClient.queryPurchases(BillingClient.SkuType.INAPP);
		if(BillingResponseCode.OK == result.getResponseCode()) {
			for(Purchase purchase : result.getPurchasesList()) {
				if(Purchase.PurchaseState.PURCHASED == purchase.getPurchaseState()) {
					// TODO 通知服务端补发货，发货完成后，客户端关闭订单。
					Purchase p = purchase;//purchases.get(0);

//		{purchaseToken = purchaseToken, orderId = orderId, productId = productId}
//		crypto.encodeBase64(data),
					JSONObject object = new JSONObject();
					try {
						Log.d(TAG, "onPurchasesUpdated responseCode: " + p.getOrderId());
						object.put("purchaseToken", p.getPurchaseToken());
						object.put("orderId", p.getOrderId());
						object.put("productId",p.getSkus());
						object.put("packageName",p.getPackageName());
						//		object.put("productId", p.get);
						Log.d(TAG, "onPurchasesUpdated responseCode: " + p.getSkus());
						AppController.notifyResultToLua(Constant.OP_CODE_PAY_RESULT, Constant.RESULT_OK, object.toString());
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
			}
		}

	}
	private class Product_Info
	{

//		String app_channel_id;	//app渠道号
//		String sub_channel;
//		String version;
//		String name;
//		int price;
//		int diamond;
//		int channel_id;			//pingxx渠道编号 123 银联支付宝微信
//		String url;
//		int user_id;
//		String open_id;
//		String developerPayload;

		public String product_Id;
//		String platform;
//		String app_bundle_id;
//		String app_package;
	}
}
