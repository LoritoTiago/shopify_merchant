import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/background_widget.dart';
import 'package:shopify_merchant/core/presentation/custom_text_field.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/tags_list_page/presentation/controller/tags_controller.dart';
import 'package:shopify_merchant/features/tags_list_page/presentation/widgets/tags_list_widget.dart';

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
                      child: TagsListWidget(
                          tags: tags, controller: _tagsController),
                    );
                  },
                ),
              ],
            ),
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
