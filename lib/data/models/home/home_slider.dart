import 'dart:convert';

import 'package:nordic_ecommerce/res/config.dart';
import 'package:nordic_ecommerce/res/utils/string_util.dart';

class HomeSlider {
  int id;
  String url;
  String image;
  String? imageMobile;
  String tilte;
  int type;
  int status;

  HomeSlider({
    required this.id,
    required this.url,
    required this.image,
    this.imageMobile,
    required this.tilte,
    required this.type,
    required this.status,
  });

  factory HomeSlider.fromJson(Map<String, dynamic> json) {
    return HomeSlider(
      id: json['id'],
      url: json['url'],
      image: StringUtil.formatImageUrl(json['image']),
      imageMobile: json['image_mobile'],
      tilte: json['title'],
      type: json['type'],
      status: json['status'],
    );
  }
}
