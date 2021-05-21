import 'package:get/get.dart';
import 'package:nordic_ecommerce/data/models/home_category.dart';

class ProductController extends GetxController {
  final _subCategories = <HomeCategory>[].obs;
  List<HomeCategory> get subCategories => this._subCategories.value;
  set subCategories(value) => this._subCategories.value = value;
}
