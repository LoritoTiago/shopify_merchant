import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';

class TrackYourStoreCard extends StatelessWidget {
  const TrackYourStoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomTheme.purple,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.only(top: 30.0, left: 15.0),
              child: const TextTitle(
                text: "Track your store\n stock",
                size: 18,
                textColor: CustomTheme.primary,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              height: 190,
              "assets/home_robot.png",
            ),
          )
        ],
      ),
    );
  }
}
