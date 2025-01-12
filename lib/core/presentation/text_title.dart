import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:sizer/sizer.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;
  final FontWeight fontWeight;
  const TextTitle(
      {super.key,
      this.fontWeight = FontWeight.w700,
      required this.text,
      this.size = 32.0,
      this.textColor = CustomTheme.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.sp,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
