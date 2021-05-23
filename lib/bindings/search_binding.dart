import 'package:get/get.dart';
import 'package:nordic_ecommerce/controllers/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
