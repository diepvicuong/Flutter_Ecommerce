import 'dart:convert';

import 'package:nordic_ecommerce/res/utils/string_util.dart';

class HomeHighlightProduct {
  int productId;
  int categoryId;
  int categoryparentId;
  String sku;
  String name;
  String description;
  int price;
  int finalPrice;
  int ispromotion;
  int percentDiscount;
  String image;
  List<String>? imagesUrl;
  int? stock;
  int? display;
  int? ratingScore;
  int? ratingCount;
  int? quantity;
  int? warranty;
  int? attachProduct;
  int? productDocument;

  HomeHighlightProduct({
    required this.productId,
    required this.categoryId,
    required this.categoryparentId,
    required this.sku,
    required this.name,
    required this.description,
    required this.price,
    required this.finalPrice,
    required this.ispromotion,
    required this.percentDiscount,
    required this.image,
    this.imagesUrl,
    this.stock,
    this.display,
    this.ratingScore,
    this.ratingCount,
    this.quantity,
    this.warranty,
    this.attachProduct,
    this.productDocument,
  });

  factory HomeHighlightProduct.fromJson(Map<String, dynamic> json) {
    return HomeHighlightProduct(
      productId: json['product_id'],
      categoryId: json['category_id'],
      categoryparentId: json['category_parent_id'],
      sku: json['sku'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      finalPrice: json['final_price'],
      ispromotion: json['is_promotion'],
      percentDiscount: json['percent_discount'],
      image: StringUtil.formatImageUrl(json['image']),
      imagesUrl: json['images_url'] != null
          ? List<String>.from(
              json['images_url'].map((x) => StringUtil.formatImageUrl(x)))
          : null,
      stock: json['stock'],
      display: json['display'],
      ratingScore: json['rating_score'],
      ratingCount: json['rating_count'],
      quantity: json['quantity'],
      warranty: json['warranty'],
      attachProduct: json['attach_product'],
      productDocument: json['product_document'],
    );
  }
}
