import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/di/di.dart';
import 'package:shopify_merchant/core/services/base_service.dart';

class TagsController extends ValueNotifier<List<String>> {
  TagsController() : super([]) {
    _setUpTags();
  }

  late TextEditingController _textSearchController;
  set setTextSearchController(TextEditingController controller) {
    _textSearchController = controller;
  }

  get getTextSearchController => _textSearchController;

  void _setUpTags() {
    Set<String> uniqueTags = {};
    final products = getIt<BaseService>().products;

    for (var product in products) {
      final tags = product.tags?.split(',') ?? [];

      for (var tag in tags) {
        final toAddTag = tag.trim().toUpperCase();
        if (uniqueTags.contains(toAddTag) == false) {
          uniqueTags.add(toAddTag);
        }
      }
    }

    value = uniqueTags.toList();

    notifyListeners();
  }

  void searchTags() {
    notifyListeners();
  }

  List<String> get getTags {
    if (_textSearchController.text.isNotEmpty) {
      return value
          .where((e) => e
              .toLowerCase()
              .contains(_textSearchController.text.toLowerCase()))
          .toList();
    }
    return value;
  }

  int getProductsWithTag({required String tag}) {
    return getIt<BaseService>()
        .products
        .where((e) => e.tags?.toUpperCase().contains(tag) ?? false)
        .length;
  }

  @override
  void dispose() {
    super.dispose();

    _textSearchController.dispose();
  }
}
