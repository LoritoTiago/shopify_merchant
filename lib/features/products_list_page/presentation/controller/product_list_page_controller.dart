import 'package:flutter/material.dart';
import 'package:shopify_merchant/features/products_list_page/data/model/order_by_model.dart';

class ProductListPageController extends ValueNotifier<int> {
  ProductListPageController() : super(0);

  late OrderByModel _orderBy;

  late TextEditingController _textSearchController;

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

  @override
  void dispose() {
    super.dispose();
    _textSearchController.dispose();
  }
}
