import 'dart:convert';

import 'package:nordic_ecommerce/data/models/home_category.dart';
import 'package:nordic_ecommerce/data/models/home_highlight_product.dart';
import 'package:nordic_ecommerce/data/models/home_promotion_product.dart';
import 'package:nordic_ecommerce/data/models/home_service.dart';
import 'package:nordic_ecommerce/data/models/home_slider.dart';

class HomeModel {
  List<HomeService>? homeServices;
  List<HomeSlider>? homeSliders;
  List<HomeCategory>? homeCategories;
  List<HomeHighlightProduct>? homeHighlightProducts;
  List<HomePromotionProduct>? homePromotionProducts;

  HomeModel({
    this.homeServices,
    this.homeSliders,
    this.homeCategories,
    this.homeHighlightProducts,
    this.homePromotionProducts,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        homeServices: List<HomeService>.from(
            json['services'].map((x) => HomeService.fromJson(x))),
        homeCategories: List<HomeCategory>.from(
            json['categories'].map((x) => HomeCategory.fromJson(x))),
        homeSliders: List<HomeSlider>.from(
            json['sliders'].map((x) => HomeSlider.fromJson(x))),
        homeHighlightProducts: List<HomeHighlightProduct>.from(
            json['highlight_products']
                .map((x) => HomeHighlightProduct.fromJson(x))),
        homePromotionProducts: List<HomePromotionProduct>.from(
            json['promotion_products']
                .map((x) => HomePromotionProduct.fromJson(x))),
      );
}
