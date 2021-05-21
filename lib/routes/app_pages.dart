import 'package:get/get.dart';
import 'package:nordic_ecommerce/bindings/product_binding.dart';
import 'package:nordic_ecommerce/modules/home/page/home_page.dart';
import 'package:nordic_ecommerce/modules/product/page/product_list_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
        name: Routes.SUB_CATALOG,
        page: () => ProductListPage(),
        binding: ProductBinding()),
  ];
}
