import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:nordic_ecommerce/data/models/home/home_model.dart';
import 'package:nordic_ecommerce/data/models/product/product_list_model.dart';
import 'package:nordic_ecommerce/data/models/product/product_model.dart';
import 'package:nordic_ecommerce/res/config.dart';

class MyApiClient {
  final Dio httpClient;
  late DioCacheManager _dioCacheManager;
  Options _cacheOptions =
      buildCacheOptions(Duration(days: 7), forceRefresh: true);
  MyApiClient({required this.httpClient}) {
    _dioCacheManager = DioCacheManager(CacheConfig());
    this.httpClient.interceptors.add(_dioCacheManager.interceptor);
  }

  fetchAll() async {
    HomeModel? homeModel;
    try {
      var response =
          await httpClient.get(AppConfig.homeUrl, options: _cacheOptions);

      if (response.statusCode == 200 && response.data['data'] != null) {
        homeModel = HomeModel.fromJson(response.data['data']);
      } else
        print('error');
    } catch (e) {
      print(e);
    }

    return homeModel;
  }

  fetchProductDataListById(int categoryId) async {
    ProductDataList? productDataList;
    try {
      print(AppConfig.productListUrl(categoryId));
      var response = await httpClient.get(AppConfig.productListUrl(categoryId),
          options: _cacheOptions);

      if (response.statusCode == 200 && response.data['data'] != null) {
        productDataList = ProductDataList.fromJson(response.data['data']);
      } else
        print('error');
    } catch (e) {
      print(e);
    }
    return productDataList;
  }

  fetchProductDataListBySearchString(String str) async {
    ProductDataList? productDataList;
    try {
      var response = await httpClient.get(AppConfig.productListSearchUrl(str),
          options: _cacheOptions);

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
      var response = await httpClient.get(AppConfig.productDetailUrl(productId),
          options: _cacheOptions);

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
