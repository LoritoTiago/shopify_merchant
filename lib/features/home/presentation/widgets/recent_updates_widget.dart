import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecentUpdatesWidget extends StatelessWidget {
  const RecentUpdatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: itemRecentUpdates(),
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

  Widget itemRecentUpdates() {
    return Padding(
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
              const TextTitle(
                text: "Aerodynamic Concrete Clock",
                size: 14.0,
                fontWeight: FontWeight.w500,
              ),
              TextNormal(
                text: timeago.format(DateTime.now()),
                size: 12.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
