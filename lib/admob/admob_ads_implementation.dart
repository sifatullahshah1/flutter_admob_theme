import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'admob_manager.dart';

class AdmobAdsImplementation extends StatefulWidget {
  const AdmobAdsImplementation({Key? key}) : super(key: key);

  @override
  _AdmobAdsImplementationState createState() => _AdmobAdsImplementationState();
}

class _AdmobAdsImplementationState extends State<AdmobAdsImplementation> {
  late InterstitialAd _interstitialAd;
  bool isInterAdLoaded = false;

  initInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdmobManager.inter_id,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    isInterAdLoaded = true;

    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _interstitialAd.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _interstitialAd.dispose();
      },
    );

    // if (isInterAdLoaded) {
    //   _interstitialAd.show();
    // }
  }

  late BannerAd _bannerAd;
  bool isBannerAdLoaded = false;

  initBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdmobManager.banner_id,
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            isBannerAdLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          print('HelloAds Ad failed to load: $error');
        },
        onAdOpened: (Ad ad) => print('HelloAds Ad opened.'),
        // onAdClosed: (Ad ad) => print('HelloAds Ad closed.'),
        // onAdImpression: (Ad ad) => print('HelloAds Ad impression.'),
      ),
    );
    _bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    initBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: isBannerAdLoaded
          ? Container(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : SizedBox(),
    );
  }
}
