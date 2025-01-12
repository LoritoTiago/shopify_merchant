import 'package:flutter/cupertino.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/product_details_item_widget.dart';
import 'package:sizer/sizer.dart';

class ProductsDetailsModal {
  static void call(
      {required BuildContext context,
      required Product item,
      required totalInventory}) {
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
        child: ProductDetailsItemWidget(
          product: item,
          totalInventory: totalInventory,
        ),
      ),
    );
  }
}
