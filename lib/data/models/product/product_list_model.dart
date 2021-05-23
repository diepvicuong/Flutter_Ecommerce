import 'dart:convert';

import 'package:nordic_ecommerce/data/models/product/product_model.dart';

class ProductDataList {
  List<Product>? productList;
  ProductDataList({
    this.productList,
  });

  factory ProductDataList.fromJson(Map<String, dynamic> json) {
    return ProductDataList(
      productList: json['products'] != null
          ? List<Product>.from(
              json['products']?.map((x) => Product.fromJson(x)))
          : null,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'ProductDataList: ${productList.toString()}';
  }
}
