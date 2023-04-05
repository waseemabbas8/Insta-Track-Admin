import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/dimens.dart';
import '../../domain/model/product.dart';
import 'products_table_data_source.dart';

class ProductsTable extends StatelessWidget {
  final List<Product> products;
  const ProductsTable({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Margin.all10,
        child: SizedBox(
          width: double.infinity,
          child: PaginatedDataTable2(
            columnSpacing: 16,
            minWidth: 600,
            source: ProductsTableSource(products: products),
            columns: const [
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(
                label: Text("Model"),
              ),
              DataColumn(
                label: Text("Price"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
