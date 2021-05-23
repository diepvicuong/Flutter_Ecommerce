import 'package:get/get.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/data/provider/share_preference.dart';

class SearchController extends GetxController {
  final _listAllProduct = <Product>[].obs;
  get listAllProduct => this._listAllProduct.value;
  set listAllProduct(value) => this._listAllProduct.value = value;

  final _listFilterProduct = <Product>[].obs;
  get listFilterProduct => this._listFilterProduct.value;
  set listFilterProduct(value) => this._listFilterProduct.value = value;

  final _recentStr = <String>[].obs;
  get recentStr => this._recentStr.value;
  set recentStr(value) => this._recentStr.value = value;

  initController() async {
    SharedPreference.getSearchRecent().then((value) {
      print(value);
      this.recentStr = value;
    });
  }
}
