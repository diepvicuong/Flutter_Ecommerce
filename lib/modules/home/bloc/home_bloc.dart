import 'dart:async';

import 'package:nordic_ecommerce/data/models/home/home_model.dart';
import 'package:nordic_ecommerce/data/repository/home_repository.dart';

class HomeBloc {
  StreamController<HomeModel> homeController = StreamController<HomeModel>();

  Stream<HomeModel> get homeStream => homeController.stream;

  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository);

  getAll() {
    homeRepository.getAll().then((data) => homeController.sink.add(data));
  }

  void dispose() {
    homeController.close();
  }
}
