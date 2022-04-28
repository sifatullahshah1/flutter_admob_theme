import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobManager {
  AdmobManager._();

  //====== Key note====================

  // 1: Android Manifest work
  // #Flutter admob ads
  // google_mobile_ads: ^1.0.1

  // 2: Android Manifest work
  // <meta-data
  // android:name="com.google.android.gms.ads.APPLICATION_ID"
  // android:value="ca-app-pub-3940256099942544~3347511713"/>
  //
  // <!--  <meta-data
  // android:name="com.google.android.gms.ads.APPLICATION_ID"
  // android:value="ca-app-pub-8957406679356515~7809599225"/>-->

  // 3: android minimum sdk version is 19

  // 4: IOS Infor.plist work
  // <key>GADApplicationIdentifier</key>
  // <string>ca-app-pub-3940256099942544~3347511713</string>
  // <key>SKAdNetworkItems</key>
  // <array>
  // <dict>
  // <key>SKAdNetworkIdentifier</key>
  // <string>cstr6suwn9.skadnetwork</string>
  // </dict>
  // </array>

  // 5: in main.dart file
  // Future<void> main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await MobileAds.instance.initialize();
  //
  //   AdmobManager.loadAppOpenAd();
  //   runApp(MyApp());
  // }

  //=============== Testing Ids ==================================================

  // static final _app_id = "ca-app-pub-3940256099942544~3347511713";
  // static final _app_open_id = "ca-app-pub-3940256099942544~3347511713";
  // static final _banner_id = "ca-app-pub-3940256099942544/6300978111";
  // static final _inter_id = "ca-app-pub-3940256099942544/1033173712";

  //=============== Real Ids ==================================================

  static final String app_id = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544~3347511713' // android
      : 'ca-app-pub-3940256099942544~3347511713'; // ios

  static final String app_open_id = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/3419835294'
      : 'ca-app-pub-3940256099942544/3419835294';

  static final String banner_id = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  static final String inter_id = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/1033173712';

  //================ Admob ==============================

  /// Load an AppOpenAd.
  static void loadAppOpenAd() {
    AppOpenAd.load(
        adUnitId: app_open_id,
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            ad.show();
          },
          onAdFailedToLoad: (error) {
            print('AppOpenAd failed to load: $error');
            // Handle the error.
          },
        ),
        orientation: AppOpenAd.orientationPortrait);
  }
}
