import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/home/presentation/home.dart';
import 'package:shopify_merchant/features/main_page/presentation/controller/main_page_controller.dart';
import 'package:shopify_merchant/features/tags_list_page/presentation/tags_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainPageController _mainPageController;

  @override
  void initState() {
    super.initState();

    _mainPageController = MainPageController();
    _mainPageController.setPageController = PageController();
    _mainPageController.setPages = [const Home(), const TagsListPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _mainPageController,
        builder: (context, value, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: PageView(
                  controller: _mainPageController.getPageController,
                  children: _mainPageController.getPages,
                ),
              ),
              _customBottomNavigationBar(),
            ],
          );
        },
      ),
    );
  }

  Widget _customBottomNavigationBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: CustomTheme.primary.withOpacity(.5),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (_mainPageController.value != 0) {
                  _mainPageController.changePage(0);
                }
              },
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: _mainPageController.value == 0
                    ? CustomTheme.black
                    : CustomTheme.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                if (_mainPageController.value != 1) {
                  _mainPageController.changePage(1);
                }
              },
              icon: Icon(
                Icons.feed_outlined,
                size: 30,
                color: _mainPageController.value == 1
                    ? CustomTheme.black
                    : CustomTheme.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mainPageController.dispose();
  }
}
