import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:sizer/sizer.dart';

class TextNormal extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;
  final FontWeight fontWeight;
  const TextNormal(
      {super.key,
      this.fontWeight = FontWeight.w400,
      required this.text,
      this.size = 14.0,
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
