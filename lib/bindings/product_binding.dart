import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:nordic_ecommerce/controllers/product/product_controller.dart';
import 'package:nordic_ecommerce/data/provider/api.dart';
import 'package:nordic_ecommerce/data/repository/product_repository.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController(
        productRepository:
            ProductRepository(apiClient: MyApiClient(httpClient: Dio()))));
  }
}
