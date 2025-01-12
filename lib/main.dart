import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/di/di.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/core/settings/environment_setting.dart';
import 'package:shopify_merchant/core/settings/responsive_setting.dart';
import 'package:shopify_merchant/core/settings/sizer_setting.dart';
import 'package:shopify_merchant/features/splash/presentation/splash.dart';

void main() async {
  runApp(const MyApp());
  EnvironmentSetting.start();
  DI.initDi();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizerSetting.start(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme.themeData,
        home: const Splash(),
        builder: (context, child) => ResponsiveSetting.start(
          context: context,
          child: child!,
        ),
      ),
    );
  }
}
