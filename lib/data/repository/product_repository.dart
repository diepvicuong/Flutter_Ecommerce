import 'package:nordic_ecommerce/data/models/product/product_list_model.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/data/provider/api.dart';

class ProductRepository {
  final MyApiClient apiClient;

  ProductRepository({required this.apiClient}) : assert(apiClient != null);

  getProductDataListById(int categoryId) {
    return apiClient.getProductDataList(categoryId);
  }
}
