import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';

class OrderByButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const OrderByButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
        decoration: BoxDecoration(
          color: isSelected
              ? CustomTheme.purple.withOpacity(.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? CustomTheme.purple : Colors.transparent,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: TextNormal(
          text: title,
          size: 12.0,
        ),
      ),
    );
  }
}
