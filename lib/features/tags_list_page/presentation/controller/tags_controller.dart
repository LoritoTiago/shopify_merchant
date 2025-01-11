import 'package:flutter/material.dart';

class TagsController extends ValueNotifier<int> {
  TagsController() : super(0);

  late TextEditingController _textSearchController;
  set setTextSearchController(TextEditingController controller) {
    _textSearchController = controller;
  }

  get getTextSearchController => _textSearchController;

  @override
  void dispose() {
    super.dispose();

    _textSearchController.dispose();
  }
}
