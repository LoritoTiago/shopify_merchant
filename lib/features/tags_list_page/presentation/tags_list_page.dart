import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_merchant/core/presentation/background_widget.dart';
import 'package:shopify_merchant/core/presentation/custom_text_field.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/products_list_page.dart';
import 'package:shopify_merchant/features/tags_list_page/presentation/controller/tags_controller.dart';

class TagsListPage extends StatefulWidget {
  const TagsListPage({super.key});

  @override
  State<TagsListPage> createState() => _TagsListPageState();
}

class _TagsListPageState extends State<TagsListPage> {
  late TagsController _tagsController;

  @override
  void initState() {
    super.initState();

    _tagsController = TagsController();
    _tagsController.setTextSearchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tagsBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextTitle(text: "Tags"),
                const SizedBox(height: 30),
                CustomTextFieldWidget(
                  background: CustomTheme.primary.withOpacity(.4),
                  hintText: "Search",
                  icon: Icons.search,
                  textEditingController:
                      _tagsController.getTextSearchController,
                  onChange: (p0) {
                    _tagsController.searchTags();
                  },
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 1,
                  color: CustomTheme.grey,
                ),
                ValueListenableBuilder(
                    valueListenable: _tagsController,
                    builder: (context, value, child) {
                      final tags = _tagsController.getTags;
                      return Expanded(
                          child: AnimationLimiter(
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
                                    child: _itemTag(item: tags[index]),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemTag({required String item}) {
    final allProductsWithThisTag =
        _tagsController.getProductsWithTag(tag: item);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const ProductsListPage(),
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
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle(
                text: item,
                size: 16.0,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              TextNormal(
                text: "$allProductsWithThisTag products",
                size: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tagsBackground({required Widget child}) {
    return BackgroundWidget(
      colors: [CustomTheme.primary, CustomTheme.purple.withOpacity(.3)],
      stops: const [.1, .9],
      begin: Alignment.centerRight,
      end: Alignment.topLeft,
      child: child,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _tagsController.dispose();
  }
}
