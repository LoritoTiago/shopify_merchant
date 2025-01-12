import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/data/repository/get_products_repository.dart';
import 'package:shopify_merchant/core/di/di.dart';
import 'package:shopify_merchant/core/error/failures/i_failures.dart';
import 'package:shopify_merchant/core/services/base_service.dart';
import 'package:shopify_merchant/features/splash/data/model/splash_state.dart';

class SplashController extends ValueNotifier<SplashStatus> {
  SplashController() : super(SplashStatus.isLoading) {
    _getProducts();
  }

  int _errorTimer = 1;

  get haveError => value == SplashStatus.haveError;

  void _getProducts() async {
    final useCase = getIt<GetProductsRepository>();
    final result = await useCase.call();

    result.fold((left) => _mapError(left: left), (right) {
      log("Success");
      getIt<BaseService>().productModel = right.products ?? [];

      _exit();
    });
  }

  void _mapError({required Failure left}) {
    log("Error");
    value = SplashStatus.haveError;
    notifyListeners();
    _tryAgain();
  }

  void _exit() {
    _errorTimer = 1;
    _timer(
      function: () {
        value = SplashStatus.loaded;
        notifyListeners();
      },
    );
  }

  void _tryAgain() {
    _timer(
      function: () {
        value = SplashStatus.isLoading;
        notifyListeners();
        _getProducts();
      },
    );
  }

  void _timer({required VoidCallback function, int seconds = 4}) {
    Future.delayed(Duration(seconds: seconds * _errorTimer), () {
      _errorTimer += 1;
      log("$_errorTimer");
      function();
    });
  }
}
