import 'package:flutter/material.dart';
import 'package:shopify_merchant/features/splash/data/model/splash_state.dart';

class SplashController extends ValueNotifier<SplashStatus> {
  SplashController() : super(SplashStatus.isLoading) {
    Future.delayed(const Duration(seconds: 4), () {
      value = SplashStatus.loaded;
      notifyListeners();
    });
  }

  void getProducts() {}
}
