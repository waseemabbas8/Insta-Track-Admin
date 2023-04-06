import 'package:flutter/material.dart';

import '../../domain/model/product.dart';

class ProductsTableSource extends DataTableSource {
  final List<Product> products;

  ProductsTableSource({required this.products});

  @override
  DataRow? getRow(int index) {
    final product = products[index];
    return DataRow(cells: [
      DataCell(Text(product.name)),
      DataCell(Text(product.model)),
      DataCell(Text(product.price.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}
