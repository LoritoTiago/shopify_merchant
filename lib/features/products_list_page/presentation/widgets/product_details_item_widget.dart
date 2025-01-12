import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/services/date_time_service.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsItemWidget extends StatefulWidget {
  final Product product;
  final int totalInventory;
  const ProductDetailsItemWidget(
      {super.key, required this.totalInventory, required this.product});

  @override
  State<ProductDetailsItemWidget> createState() =>
      _ProductDetailsItemWidgetState();
}

class _ProductDetailsItemWidgetState extends State<ProductDetailsItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 6,
      ),
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.3).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(50.0)),
      color: CustomTheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 40.0.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(45.0),
            ),
            child: ClipRRect(
              child: AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: 'assets/icon.png',
                        placeholderColorBlendMode: BlendMode.clear,
                        image: widget.product.image?.src ?? "",
                        fadeInDuration: const Duration(
                          milliseconds: 300,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(child: SingleChildScrollView(child: texts())),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: CustomTheme.purple,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: const TextNormal(
                  text: "Update Product",
                  size: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget texts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextNormal(
            text: widget.product.tags ?? "",
            textColor: CustomTheme.grey,
            size: 14.0,
          ),
          const SizedBox(height: 10),
          TextTitle(
            text: widget.product.title ?? "",
            size: 20,
          ),
          const SizedBox(height: 5),
          TextNormal(
            text: "Total inventory: ${widget.totalInventory}",
            size: 14.0,
          ),
          const SizedBox(height: 5),
          TextNormal(
            text: "Status: ${widget.product.status?.toUpperCase()}",
            size: 14.0,
          ),
          const SizedBox(height: 5),
          TextNormal(
            text: "Product Type: ${widget.product.productType}",
            size: 14.0,
          ),
          const SizedBox(height: 5),
          TextNormal(
            text:
                "Created at: ${DateTimeService.toWeekday(date: widget.product.createdAt!)}",
            size: 12.0,
          ),
          TextNormal(
            text:
                "Published at: ${DateTimeService.toWeekday(date: widget.product.publishedAt!)}",
            size: 12.0,
          ),
          TextNormal(
            text:
                "Updated at: ${DateTimeService.toWeekday(date: widget.product.updatedAt!)}",
            size: 12.0,
          ),
        ],
      ),
    );
  }
}
