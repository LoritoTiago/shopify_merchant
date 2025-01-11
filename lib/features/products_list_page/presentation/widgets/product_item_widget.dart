import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/products_details_modal.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductItemWidget extends StatelessWidget {
  final int tag;
  const ProductItemWidget({super.key, required this.tag});

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => _showModal(context: context, tag: tag),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset("assets/icon.png"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: TextTitle(
                            text: "Aerodynamic Concrete Clock",
                            size: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextNormal(
                            text: timeago.format(DateTime.now(),
                                locale: 'en_short')),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Expanded(
                          child: TextNormal(
                            text: "Total inventory: 2039",
                            size: 12.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.more_horiz_rounded,
                            color: CustomTheme.black,
                          ),
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

  void _showModal({required BuildContext context, required int tag}) {
    ProductsDetailsModal.call(context: context, item: tag);
  }
}
