import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/controller/product_list_page_controller.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/product_item_widget.dart';

class ProductListWidget extends StatelessWidget {
  final ProductListPageController controller;
  const ProductListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        key: ValueKey("${controller.getProducts.length}"),
        child: ListView.builder(
          itemCount: controller.getProducts.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ProductItemWidget(
                      controller: controller,
                      item: controller.getProducts[index],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
