import 'package:get/instance_manager.dart';
import 'package:nordic_ecommerce/controllers/product/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
