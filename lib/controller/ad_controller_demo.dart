// import 'dart:ui';
// import 'package:aniwatch_tv/ad_helper.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class AdControllerDemo extends GetxController{
//
//   static AdControllerDemo get to => Get.find();
//
//   final GetStorage _box = GetStorage();
//
//   // Map to hold multiple BannerAds with unique identifiers
//   final Map<String, BannerAd> _bannerAds = {};
//
//   InterstitialAd? _interstitialAd;
//   bool _isInterstitialAdReady = false;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadInterstitialAd();
//     // Load BannerAds as needed with unique keys
//     // For example, you can preload some ads or load them on demand
//   }
//
//   @override
//   void onClose() {
//     // Dispose all banner ads
//     for (var ad in _bannerAds.values) {
//       ad.dispose();
//     }
//     // Dispose interstitial ad
//     _interstitialAd?.dispose();
//     super.onClose();
//   }
//
//   /// Load a BannerAd with a unique identifier
//   void loadBannerAd(String adId, VoidCallback onAdLoaded) {
//     if (_bannerAds.containsKey(adId)) {
//       // Ad already loaded for this adId
//       return;
//     }
//
//     BannerAd bannerAd = BannerAd(
//       adUnitId: AdHelper.bannerAdUnitId,
//       request: const AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           _bannerAds[adId] = ad as BannerAd;
//           update(); // Notify listeners
//           print('Banner Ad $adId loaded');
//           onAdLoaded();
//         },
//         onAdFailedToLoad: (ad, err) {
//           print('Failed to load Banner Ad $adId: ${err.message}');
//           ad.dispose();
//         },
//       ),
//     );
//
//     bannerAd.load();
//   }
//
//   /// Retrieve a BannerAd by its unique identifier
//   BannerAd? getBannerAd(String adId) {
//     return _bannerAds[adId];
//   }
//
//   /// Remove and dispose a BannerAd by its unique identifier
//   void removeBannerAd(String adId) {
//     if (_bannerAds.containsKey(adId)) {
//       _bannerAds[adId]?.dispose();
//       _bannerAds.remove(adId);
//       update();
//     }
//   }
//
//   void _loadInterstitialAd() {
//     InterstitialAd.load(
//       adUnitId: AdHelper.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           _interstitialAd = ad;
//           _isInterstitialAdReady = true;
//           _interstitialAd?.setImmersiveMode(true);
//           print('Interstitial Ad loaded');
//           _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
//             onAdDismissedFullScreenContent: (InterstitialAd ad) {
//               ad.dispose();
//               _isInterstitialAdReady = false;
//               _loadInterstitialAd(); // Load a new interstitial ad
//             },
//             onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//               ad.dispose();
//               _isInterstitialAdReady = false;
//               _loadInterstitialAd(); // Load a new interstitial ad
//             },
//           );
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           print('Interstitial Ad failed to load: $error');
//           _isInterstitialAdReady = false;
//         },
//       ),
//     );
//   }
//
//   void showInterstitialAd() {
//     int value = _box.read("adValue") ?? 0;
//     if (value >= 2 && _isInterstitialAdReady) {
//       _interstitialAd?.show();
//       _box.write("adValue", 0);
//     } else {
//       value++;
//       _box.write("adValue", value);
//       print('Interstitial Ad not shown. Current count: $value');
//     }
//   }
//
//
//
// }