import 'package:nordic_ecommerce/data/provider/api.dart';

class HomeRepository {
  final MyApiClient apiClient;

  HomeRepository({required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }
}
