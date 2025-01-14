import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/home/presentation/conrtoller/home_controller.dart';

class DashboardWidget extends StatelessWidget {
  final HomeController controller;

  const DashboardWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextTitle(
          text: "Dashboard",
          size: 20,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: CustomTheme.primary,
              boxShadow: [
                BoxShadow(
                  color: CustomTheme.grey.withOpacity(.3),
                  blurRadius: 60,
                  spreadRadius: 0,
                  offset: const Offset(0, 20),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomTheme.orange2.withOpacity(.2),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Icon(
                        Icons.store,
                        color: CustomTheme.orange2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextTitle(text: "${controller.getTotalProducts}"),
                    const SizedBox(width: 10),
                    const TextNormal(
                      text: "products",
                      fontWeight: FontWeight.w400,
                      textColor: CustomTheme.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  height: 1,
                  color: CustomTheme.grey.withOpacity(.5),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const TextNormal(
                      text: "Active",
                      textColor: Colors.green,
                    ),
                    const SizedBox(width: 5),
                    TextNormal(text: "${controller.getActiveProducts}"),
                    const Spacer(),
                    const TextNormal(
                      text: "Inactive",
                      textColor: Colors.red,
                    ),
                    const SizedBox(width: 5),
                    TextNormal(text: "${controller.getInActiveProducts}"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
