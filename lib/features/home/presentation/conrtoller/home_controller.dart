import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/di/di.dart';
import 'package:shopify_merchant/core/services/base_service.dart';

class HomeController extends ValueNotifier<List<Product>> {
  HomeController() : super(getIt<BaseService>().products);

  int get getTotalProducts => value.length;
  int get getActiveProducts => value
      .where((e) => e.status?.toLowerCase() == "active".toLowerCase())
      .length;
  int get getInActiveProducts => value
      .where((e) => e.status?.toLowerCase() != "active".toLowerCase())
      .length;

  List<Product> get getLastUpdated {
    final currentProducts = value;

    currentProducts.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
    return currentProducts.take(5).toList();
  }
}
