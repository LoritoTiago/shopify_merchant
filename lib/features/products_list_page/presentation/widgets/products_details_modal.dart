import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/services/date_time_service.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:sizer/sizer.dart';

class ProductsDetailsModal {
  static void call({required BuildContext context, required int item}) {
    showCupertinoModalPopup(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext modalContext) => Container(
        height: 90.0.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: CustomTheme.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        ),
        child: Material(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(50.0)),
          color: CustomTheme.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(45.0),
                child: SizedBox(
                  height: 40.0.h,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/dengun_logo.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: SingleChildScrollView(child: _texts())),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _texts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextNormal(
            text: "Awesome, Chair, Coppe",
            textColor: CustomTheme.grey,
            size: 14.0,
          ),
          const SizedBox(height: 10),
          const TextTitle(
            text: "Aerodynamic Concrete Clock",
            size: 20,
          ),
          const SizedBox(height: 5),
          const TextNormal(
            text: "Total inventory: 10",
            size: 14.0,
          ),
          const SizedBox(height: 5),
          const TextNormal(
            text: "Status: ACTIVE",
            size: 14.0,
          ),
          const SizedBox(height: 5),
          const TextNormal(
            text: "Product Type: Chair",
            size: 14.0,
          ),
          const SizedBox(height: 5),
          TextNormal(
            text:
                "Created at: ${DateTimeService.toWeekday(date: DateTime.now())}",
            size: 12.0,
          ),
          TextNormal(
            text:
                "Published at: ${DateTimeService.toWeekday(date: DateTime.now())}",
            size: 12.0,
          ),
          TextNormal(
            text:
                "Updated at: ${DateTimeService.toWeekday(date: DateTime.now())}",
            size: 12.0,
          ),
        ],
      ),
    );
  }
}
