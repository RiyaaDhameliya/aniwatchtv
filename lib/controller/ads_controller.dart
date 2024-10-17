import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_helper.dart';


class AdsController extends GetxController{
  GetStorage box = GetStorage();

  late InterstitialAd interstitialAd;


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


