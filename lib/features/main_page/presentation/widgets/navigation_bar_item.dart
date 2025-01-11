import 'package:flutter/material.dart';

class BottomNavigationBarItemWidget extends BottomNavigationBarItem {
  final Widget iconWidget;
  final String title;

  const BottomNavigationBarItemWidget(
      {required this.iconWidget, required this.title})
      : super(icon: iconWidget, activeIcon: iconWidget, label: title);
}
