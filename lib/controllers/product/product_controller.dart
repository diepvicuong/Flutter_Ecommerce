import 'package:get/get.dart';
import 'package:nordic_ecommerce/data/models/product/product_list_model.dart';

import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/data/repository/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository;

  ProductController({
    required this.productRepository,
  });

  final _productList = <Product>[].obs;
  get productList => this._productList.value;
  set productList(value) => this._productList.value = value;

  final _selectedProductDetail = null.obs;
  get selectedProductDetail => this._productList.value;
  set selectedProductDetail(value) => this._productList.value = value;

  getProductListById(int categoryId) {
    productRepository.getProductDataListById(categoryId).then((value) {
      print(value);
      if (value is ProductDataList) {
        this.productList = value.productList;
      }
    });
  }

  getDetailById(int productId) {
    productRepository.getProductDetailById(productId).then((value) {
      print(value);
      if (value is Product) {
        this.productList = value;
      }
    });
  }
}
