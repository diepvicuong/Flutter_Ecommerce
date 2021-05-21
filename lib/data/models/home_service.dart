import 'dart:convert';

import 'package:nordic_ecommerce/res/config.dart';

class HomeService {
  int? id;
  String? url;
  String imageUrl;
  String? imageMobile;
  String title;
  int? type;
  int? status;

  HomeService({
    this.id,
    this.url,
    required this.imageUrl,
    this.imageMobile,
    required this.title,
    this.type,
    this.status,
  });

  factory HomeService.fromJson(Map<String, dynamic> json) {
    return HomeService(
      id: json['id'],
      url: json['url'],
      imageUrl: AppConfig.baseUrl + json['image'],
      imageMobile: json['image_mobile'],
      title: json['title'],
      type: json['type'],
      status: json['status'],
    );
  }
}
