import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nordic_ecommerce/data/models/home_model.dart';
import 'package:nordic_ecommerce/res/config.dart';

class MyApiClient {
  final Dio httpClient;

  MyApiClient({required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(AppConfig.homeUrl);

      if (response.statusCode == 200 && response.data['data'] != null) {
        HomeModel homeModel = HomeModel.fromJson(response.data['data']);
        // List<MyModel> listMyModel = jsonResponse.map((model) => MyModel.fromJson(model)).toList();

        return homeModel;
      } else
        print('error');
    } catch (e) {
      print(e);
    }
  }
}
