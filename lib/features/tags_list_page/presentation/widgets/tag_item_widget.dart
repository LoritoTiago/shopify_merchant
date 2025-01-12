import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/products_list_page.dart';
import 'package:shopify_merchant/features/tags_list_page/presentation/controller/tags_controller.dart';

class TagItemWidget extends StatelessWidget {
  final TagsController controller;
  final String tag;
  const TagItemWidget({super.key, required this.controller, required this.tag});

  @override
  Widget build(BuildContext context) {
    final allProductsWithThisTag = controller.getProductsWithTag(tag: tag);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ProductsListPage(
                tag: tag,
                products: allProductsWithThisTag,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: CustomTheme.primary.withOpacity(.2),
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: CustomTheme.grey.withOpacity(.2),
                offset: const Offset(0, 0),
                blurRadius: 80,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle(
                text: tag,
                size: 16.0,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              TextNormal(
                text: "${allProductsWithThisTag.length} products",
                size: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
