import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/controller/product_list_page_controller.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/products_details_modal.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductItemWidget extends StatelessWidget {
  final ProductListPageController controller;
  final Product item;

  const ProductItemWidget(
      {super.key, required this.item, required this.controller});

  @override
  Widget build(context) {
    final totalInventory = controller.getTotalVariants(product: item);
    return InkWell(
      onTap: () => _showModal(context: context, totalInventory: totalInventory),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomTheme.grey.withOpacity(.1),
                  image: DecorationImage(
                    image: FadeInImage.assetNetwork(
                      placeholder: 'assets/icon.png',
                      image: item.image?.src ?? "",
                      fadeInDuration: const Duration(
                        milliseconds: 300,
                      ),
                    ).image,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextTitle(
                            text: item.title ?? "",
                            size: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextNormal(
                            text: timeago.format(item.createdAt!,
                                locale: 'en_short')),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: TextNormal(
                            text: "Total inventory: $totalInventory",
                            size: 12.0,
                          ),
                        ),
                        const Icon(
                          Icons.more_horiz_rounded,
                          color: CustomTheme.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showModal(
      {required BuildContext context, required int totalInventory}) {
    ProductsDetailsModal.call(
        context: context, item: item, totalInventory: totalInventory);
  }
}
