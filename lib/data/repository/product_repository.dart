import 'package:nordic_ecommerce/data/models/product/product_list_model.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/data/provider/api.dart';

class ProductRepository {
  final MyApiClient apiClient;

  ProductRepository({required this.apiClient}) : assert(apiClient != null);

  getProductDataListById(int categoryId) async {
    return await apiClient.fetchProductDataListById(categoryId);
  }

  getProductDataListBySearchString(String str) async {
    return await apiClient.fetchProductDataListBySearchString(str);
  }

  getProductDetailById(int categoryId) {
    return apiClient.fetchProductDetail(categoryId);
  }
}
