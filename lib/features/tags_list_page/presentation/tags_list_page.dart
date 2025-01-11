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
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 1,
                  color: CustomTheme.grey,
                ),
                ValueListenableBuilder(
                    valueListenable: _tagsController,
                    builder: (context, value, child) {
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
                                    child: _itemTag(),
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

  Widget _itemTag() {
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
              const TextTitle(
                text: "Aerodynamic Concrete Clock",
                size: 16.0,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Expanded(
                    child: TextNormal(
                      text: "20 products",
                      size: 12.0,
                    ),
                  ),
                  const TextNormal(
                    text: "Status",
                    size: 9.0,
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomTheme.green,
                    ),
                  ),
                ],
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
