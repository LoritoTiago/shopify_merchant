import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/features/products_list_page/data/model/order_by_model.dart';

class ProductListPageController extends ValueNotifier<List<Product>> {
  ProductListPageController() : super([]);

  late OrderByModel _orderBy;

  late TextEditingController _textSearchController;

  set setProducts(List<Product> products) {
    value = products;
    notifyListeners();
  }

  void searchProducts() {
    notifyListeners();
  }

  set setOrderBy(OrderByModel orderBy) => _orderBy = orderBy;

  set setTextSearchController(TextEditingController controller) {
    _textSearchController = controller;
  }

  get isOrderByAndZ => _orderBy == OrderByModel.aandz;
  get isOrderByDate => _orderBy == OrderByModel.date;
  get getTextSearchController => _textSearchController;

  get getOrderBy => _orderBy;

  set changeOrderStatus(OrderByModel orderBy) {
    _orderBy = orderBy;
    notifyListeners();
  }

  List<Product> get getProducts {
    if (_textSearchController.text.isNotEmpty) {
      final result = value
          .where(
            (e) =>
                e.title
                    ?.toLowerCase()
                    .contains(_textSearchController.text.toLowerCase()) ??
                false,
          )
          .toList();
      return _orderProducts(products: result);
    }
    return _orderProducts(products: value);
  }

  List<Product> _orderProducts({required List<Product> products}) {
    if (_orderBy == OrderByModel.aandz) {
      products.sort((a, b) => a.title!.compareTo(b.title!));

      return products;
    }
    if (_orderBy == OrderByModel.date) {
      products.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

      return products;
    }

    return products;
  }

  int getTotalVariants({required Product product}) {
    final variants = product.variants ?? [];
    int total = 0;
    for (var element in variants) {
      final quantity = element.inventoryQuantity ?? 0;
      total += quantity;
    }

    return total;
  }

  @override
  void dispose() {
    super.dispose();
    _textSearchController.dispose();
  }
}
