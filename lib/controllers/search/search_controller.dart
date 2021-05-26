import 'package:get/get.dart';
import 'package:nordic_ecommerce/controllers/product/product_controller.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/data/provider/share_preference.dart';
import 'package:nordic_ecommerce/modules/product/page/product_list_page.dart';
import 'package:nordic_ecommerce/res/utils/string_util.dart';

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

  var isLoading = false.obs;

  initController() async {
    SharedPreference.getSearchRecent().then((value) {
      print(value);
      this.recentStr = value;
    });
  }

  searchProductByStr(String value) async {
    await Get.find<ProductController>().getProductListBySearchString(value);

    if (Get.find<ProductController>().productList.isEmpty) {
      Get.snackbar('Fail', 'Product list is empty');
    } else {
      final _strArr = Get.find<SearchController>().recentStr;
      SharedPreference.setSearchRecent(StringUtil.addStrToArr(_strArr, value));

      Get.off(
        ProductListPage(
          title: value,
          isSearching: true,
        ),
      );
    }
  }
}
