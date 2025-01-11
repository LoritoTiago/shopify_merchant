import 'package:flutter/material.dart';
import 'package:shopify_merchant/features/main_page/presentation/main_page.dart';
import 'package:shopify_merchant/features/splash/data/model/splash_state.dart';
import 'package:shopify_merchant/features/splash/presentation/controller/splash_controller.dart';
import 'package:shopify_merchant/features/splash/presentation/widgets/robot_animation_widget.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late SplashController _splashController;

  @override
  void initState() {
    super.initState();
    _splashController = SplashController();
  }

  @override
  void dispose() {
    super.dispose();
    _splashController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _splashController,
        builder: (context, value, child) {
          if (_splashController.value == SplashStatus.loaded) {
            return const MainPage();
          }

          return _splashWidget();
        },
      ),
    );
  }

  Widget _splashWidget() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RobotAnimationWidget(),
      ],
    );
  }
}
