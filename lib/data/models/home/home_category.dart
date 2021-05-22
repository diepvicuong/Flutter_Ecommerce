import 'dart:convert';

import 'package:nordic_ecommerce/res/config.dart';

class HomeCategory {
  int id;
  String name;
  String desc;
  String imageUrl;
  int parentId;
  int isDeleted;
  int position;
  List<HomeCategory>? subCategories;

  HomeCategory({
    required this.id,
    required this.name,
    required this.desc,
    required this.imageUrl,
    required this.parentId,
    required this.isDeleted,
    required this.position,
    this.subCategories,
  });

  factory HomeCategory.fromJson(Map<String, dynamic> json) {
    String imageUrl = json['image'];
    if (!imageUrl.contains('https')) {
      imageUrl = AppConfig.baseUrl + imageUrl;
    }
    return HomeCategory(
      id: json['category_id'],
      name: json['name'],
      desc: json['description'],
      imageUrl: imageUrl,
      parentId: json['parent_id'],
      isDeleted: json['is_deleted'],
      position: json['position'],
      subCategories: json['sub_category'] != null
          ? List<HomeCategory>.from(
              json['sub_category']?.map((x) => HomeCategory.fromJson(x)))
          : null,
    );
  }
}
