import 'package:flutter/material.dart';

class MainPageController extends ValueNotifier<int> {
  MainPageController() : super(0);

  List<Widget> _pages = [];

  late PageController _pageController;

  set setPages(List<Widget> pages) {
    _pages = pages;
  }

  set setPageController(PageController pageController) {
    _pageController = pageController;
  }

  get getPages => _pages;
  get getPageController => _pageController;

  void changePage(int value) {
    this.value = value;

    if (value == 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
    if (value == 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
    notifyListeners();
  }
}
