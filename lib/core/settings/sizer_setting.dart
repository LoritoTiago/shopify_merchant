import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class SizerSetting {
  static Widget start({required Widget child}) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return child;
      },
    );
  }
}
