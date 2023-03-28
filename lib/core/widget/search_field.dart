import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';

class SearchField extends StatelessWidget {
  SearchField({this.onSearch, Key? key}) : super(key: key);

  final controller = TextEditingController();
  final Function(String value)? onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        hintText: "search...",
        isDense: true,
        fillColor: Get.theme.cardColor,
      ),
      onEditingComplete: () {
        onSearch?.call(controller.text);
        FocusScope.of(context).unfocus();
      },
      textInputAction: TextInputAction.search,
      style: TextStyle(color: AppColors.fontColorPallets[1]),
    );
  }
}
