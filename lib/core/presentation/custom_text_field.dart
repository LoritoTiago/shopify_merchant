import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final VoidCallback? onClean;
  final int? maxLength;
  final int? maxLine;
  final Widget? suffix;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;

  final String iconPath;
  final Function(String)? onChange;
  final Color background;
  const CustomTextFieldWidget({
    this.onChange,
    this.suffix,
    required this.background,
    this.onClean,
    this.iconPath = "",
    this.maxLine = 1,
    required this.hintText,
    this.icon,
    this.textInputType = TextInputType.text,
    required this.textEditingController,
    this.maxLength = 80,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      maxLines: maxLine,
      controller: textEditingController,
      onChanged: onChange,
      keyboardType: textInputType,
      style: const TextStyle(color: CustomTheme.black),
      decoration: InputDecoration(
        counter: const SizedBox(),
        suffix: suffix,
        prefixIcon: Icon(
          icon,
          color: CustomTheme.grey,
        ),
        hintText: hintText,
        labelStyle: const TextStyle(color: CustomTheme.black),
        hintStyle: const TextStyle(
          color: CustomTheme.black,
        ),
        fillColor: background,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: background,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: background,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: background,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
