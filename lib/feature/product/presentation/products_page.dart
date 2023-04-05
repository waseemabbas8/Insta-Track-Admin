import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base_page.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/button_widget.dart';
import '../../../core/widget/header.dart';
import '../../../core/widget/search_field.dart';
import 'component/products_table.dart';
import 'products_controller.dart';

class ProductsPage extends BasePage<ProductsController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: 'Manage Products'),
          Spacing.v10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFilledButton(
                text: 'Add new Product',
                icon: const Icon(Icons.add, color: Colors.white),
                size: ButtonSize.small,
                onPressed: controller.onNewProduct,
              ),
              SizedBox(
                width: 350,
                child: SearchField(onSearch: controller.onSearch),
              ),
            ],
          ),
          Obx(
            () => controller.loadingData
                ? const CircularProgressIndicator()
                : controller.products.isEmpty
                    ? Text('No Products found', style: Get.textTheme.titleMedium)
                    : Expanded(
                        child: ProductsTable(products: controller.products),
                      ),
          ),
        ],
      ),
    );
  }
}
