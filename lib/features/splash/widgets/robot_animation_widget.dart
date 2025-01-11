import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RobotAnimationWidget extends StatelessWidget {
  const RobotAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        'assets/robot_loading.json',
        width: 300.0,
        repeat: true,
      ),
    );
  }
}
