import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nordic_ecommerce/data/models/home/home_model.dart';
import 'package:nordic_ecommerce/data/models/product/product_list_model.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/res/config.dart';

class MyApiClient {
  final Dio httpClient;

  MyApiClient({required this.httpClient});

  fetchAll() async {
    HomeModel? homeModel;
    try {
      var response = await httpClient.get(AppConfig.homeUrl);

      if (response.statusCode == 200 && response.data['data'] != null) {
        homeModel = HomeModel.fromJson(response.data['data']);
      } else
        print('error');
    } catch (e) {
      print(e);
    }

    return homeModel;
  }

  fetchProductDataList(int categoryId) async {
    ProductDataList? productDataList;
    try {
      print(AppConfig.productListUrl(categoryId));
      var response = await httpClient.get(AppConfig.productListUrl(categoryId));

      if (response.statusCode == 200 && response.data['data'] != null) {
        productDataList = ProductDataList.fromJson(response.data['data']);
      } else
        print('error');
    } catch (e) {
      print(e);
    }
    return productDataList;
  }

  fetchProductDetail(int productId) async {
    Product? product;
    try {
      print(AppConfig.productListUrl(productId));
      var response =
          await httpClient.get(AppConfig.productDetailUrl(productId));

      if (response.statusCode == 200 && response.data['data'] != null) {
        product = Product.fromJson(response.data['data']);
      } else
        print('error');
    } catch (e) {
      print(e);
    }
    return product;
  }
}
