import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_merchant/features/tags_list_page/presentation/controller/tags_controller.dart';
import 'package:shopify_merchant/features/tags_list_page/presentation/widgets/tag_item_widget.dart';

class TagsListWidget extends StatelessWidget {
  final TagsController controller;
  final List<String> tags;
  const TagsListWidget(
      {super.key, required this.tags, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      key: ValueKey("${tags.length}"),
      child: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TagItemWidget(
                    tag: tags[index],
                    controller: controller,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
