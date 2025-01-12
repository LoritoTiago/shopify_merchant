import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/presentation/background_widget.dart';
import 'package:shopify_merchant/core/presentation/custom_text_field.dart';
import 'package:shopify_merchant/core/presentation/text_normal.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/core/settings/custom_theme.dart';
import 'package:shopify_merchant/features/products_list_page/data/model/order_by_model.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/controller/product_list_page_controller.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/order_by_button.dart';
import 'package:shopify_merchant/features/products_list_page/presentation/widgets/product_list_widget.dart';

class ProductsListPage extends StatefulWidget {
  final List<Product> products;
  const ProductsListPage(
      {super.key, required String tag, required this.products});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  late ProductListPageController _productsController;

  @override
  void initState() {
    super.initState();

    _productsController = ProductListPageController();
    _productsController.setProducts = widget.products;

    _productsController.setTextSearchController = TextEditingController();
    _productsController.setOrderBy = OrderByModel.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _productsBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ValueListenableBuilder(
              valueListenable: _productsController,
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomTheme.primary,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextTitle(text: "Products"),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      background: CustomTheme.primary.withOpacity(.4),
                      hintText: "Search",
                      icon: Icons.search,
                      textEditingController:
                          _productsController.getTextSearchController,
                      onChange: (p0) {
                        _productsController.searchProducts();
                      },
                    ),
                    const SizedBox(height: 10),
                    _orderByRow(),
                    const SizedBox(height: 10),
                    const Divider(
                      height: 1,
                      color: CustomTheme.grey,
                    ),
                    ProductListWidget(controller: _productsController),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _productsBackground({required Widget child}) {
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

    _productsController.dispose();
  }

  Widget _orderByRow() {
    return Row(
      children: [
        const Spacer(),
        const TextNormal(
          text: "Order by: ",
          textColor: CustomTheme.grey,
        ),
        OrderByButton(
          isSelected: _productsController.isOrderByAndZ,
          onTap: () {
            _productsController.changeOrderStatus = OrderByModel.aandz;
            HapticFeedback.vibrate();
          },
          title: "A-Z",
        ),
        const SizedBox(width: 5),
        OrderByButton(
          isSelected: _productsController.isOrderByDate,
          onTap: () {
            _productsController.changeOrderStatus = OrderByModel.date;
            HapticFeedback.vibrate();
          },
          title: "Date",
        )
      ],
    );
  }
}
