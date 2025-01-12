import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/home/presentation/conrtoller/home_controller.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/controller/product_list_page_controller.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/products_details_modal.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecentUpdatesWidget extends StatelessWidget {
  final HomeController controller;
  const RecentUpdatesWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final lastUpdated = controller.getLastUpdated;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextTitle(
          text: "Recent updates",
          size: 20,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        Divider(
          height: 1,
          color: CustomTheme.grey.withOpacity(.5),
        ),
        Expanded(
            child: AnimationLimiter(
          key: const ValueKey("5"),
          child: ListView.builder(
            itemCount: lastUpdated.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: itemRecentUpdates(
                          item: lastUpdated[index], context: context),
                    ),
                  ),
                ),
              );
            },
          ),
        )),
      ],
    );
  }

  Widget itemRecentUpdates(
      {required Product item, required BuildContext context}) {
    final productController = ProductListPageController();

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => _showModal(
          context: context,
          item: item,
          totalInventory: productController.getTotalVariants(product: item)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_outward_sharp,
              color: CustomTheme.purple,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle(
                  text: item.title ?? "",
                  size: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                TextNormal(
                  text: timeago.format(
                    item.updatedAt!,
                  ),
                  size: 12.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showModal(
      {required BuildContext context,
      required int totalInventory,
      required Product item}) {
    ProductsDetailsModal.call(
        context: context, item: item, totalInventory: totalInventory);
  }
}
