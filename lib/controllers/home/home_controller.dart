import 'package:get/get.dart';
import 'package:nordic_ecommerce/data/models/home_category.dart';
import 'package:nordic_ecommerce/data/models/home_model.dart';
import 'package:nordic_ecommerce/data/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  final _homeModel = HomeModel().obs;
  HomeModel get homeModel => this._homeModel.value;
  set homeModel(value) => this._homeModel.value = value;

  getAll() {
    homeRepository.getAll().then((data) {
      this.homeModel = data;
    });
  }

  HomeCategory? selectedCatalog;
}
