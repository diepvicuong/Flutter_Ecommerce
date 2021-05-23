import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:nordic_ecommerce/controllers/home/home_controller.dart';
import 'package:nordic_ecommerce/controllers/product/product_controller.dart';
import 'package:nordic_ecommerce/data/provider/api.dart';
import 'package:nordic_ecommerce/data/repository/home_repository.dart';
import 'package:nordic_ecommerce/data/repository/product_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          homeRepository:
              HomeRepository(apiClient: MyApiClient(httpClient: Dio())));
    });

    Get.put<ProductController>(ProductController(
        productRepository:
            ProductRepository(apiClient: MyApiClient(httpClient: Dio()))));
  }
}
