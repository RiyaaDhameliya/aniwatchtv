import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_helper.dart';


class AdsController extends GetxController{
  GetStorage box = GetStorage();

  BannerAd? bannerAd;

  late InterstitialAd interstitialAd;

  void loadBannerAds(){
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
            bannerAd = ad as BannerAd;
            update();
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  void loadInterstitialAds(){
    InterstitialAd.load(
      adUnitId:AdHelper.interstitialAdUnitId,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          interstitialAd = ad;

          interstitialAd.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
        },
      ), request: const AdRequest());}

  void showAdd(){
    int value =  box.read("addValue") ?? 0;
    if(value == 2){
      interstitialAd.show();
      box.write("addValue", 0);
    }else{
      value++;
      box.write("addValue", value);
    }
  }

}