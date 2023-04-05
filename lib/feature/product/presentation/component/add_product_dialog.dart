import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/dimens.dart';
import '../../../../core/widget/button_widget.dart';
import '../products_controller.dart';
import '../../../../core/utils/strings_ext.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.find();
    return Dialog(
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: Margin.all16,
          child: Form(
            key: controller.formKey,
            autovalidateMode:
            controller.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacing.v20,
                Text('Add New Product', style: Get.textTheme.titleLarge),
                Spacing.v20,
                const Divider(),
                Spacing.v20,
                TextFormField(
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  controller: controller.productNameController,
                  validator: (input) =>
                  input.isNotNullOrEmpty() ? null : 'Product name cannot be empty',
                  style: Get.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                Spacing.v12,
                TextFormField(
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  controller: controller.productModelController,
                  validator: (input) => input.isNotNullOrEmpty() ? null : 'Model cannot be empty',
                  style: Get.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Model',
                  ),
                ),
                Spacing.v12,
                TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  controller: controller.productPriceController,
                  validator: (input) => input.isNotNullOrEmpty() ? null : 'Price cannot be empty',
                  style: Get.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                Spacing.v12,
                SizedBox(
                  width: Get.width,
                  child: LoadingViewButton(
                    text: 'Save Product',
                    onPressed: controller.onAddProduct,
                    isLoading: controller.loadingData,
                  ),
                ),
                Spacing.v12,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
