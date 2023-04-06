import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/feature/product/presentation/component/add_product_dialog.dart';

import '../../../core/base_page.dart';
import '../../../core/data/response.dart';
import '../../../core/data/use_case.dart';
import '../domain/model/product.dart';
import '../domain/usecase/create_product.dart';
import '../domain/usecase/get_products.dart';

class ProductsController extends BaseController {
  final GetProductsUseCase getProducts;
  final CreateProductUseCase createProduct;

  ProductsController({required this.getProducts, required this.createProduct});

  final RxList<Product> _products = RxList();

  List<Product> get products => _products;
  List<Product> _initProductsList = List.empty();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productModelController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool _autoValidate = false.obs;

  get autoValidate => _autoValidate.value;

  @override
  void onInit() {
    _observeProducts();
    super.onInit();
  }

  void _observeProducts() {
    setLoadingState(true);
    getProducts(params: NoParams.getInstance()).listen((result) {
      if (result is SuccessResult) {
        _products.value = (result as SuccessResult).data;
        _initProductsList = (result as SuccessResult).data;
      } else {
        _products.value = List.empty();
      }
      setLoadingState(false);
    });
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      _products.value = _initProductsList;
      return;
    }
    final tempProducts = products.where((product) => product.matchesSearchResult(value));
    _products.value = tempProducts.toList();
  }

  void onNewProduct() {
    Get.dialog(const AddProductDialog());
  }

  void onAddProduct() async {
    if (formKey.currentState?.validate() == false) return;
    setLoadingState(true);
    final CreateProductParams params = CreateProductParams(
      name: productNameController.text,
      model: productModelController.text,
      price: int.parse(productPriceController.text),
    );
    final result = await createProduct(params: params);
    if(result is ErrorResult) {
      Get.snackbar('Error', (result as ErrorResult).e.message);
      setLoadingState(false);
    } else {
      Get.back();
    }
  }
}
