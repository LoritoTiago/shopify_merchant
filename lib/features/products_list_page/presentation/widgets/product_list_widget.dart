import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/product_item_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        key: const ValueKey("20"),
        child: ListView.builder(
          itemCount: 20,
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
                      tag: index,
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
