import 'package:nordic_ecommerce/res/utils/string_util.dart';

class Product {
  int productId;
  int categoryId;
  int categoryparentId;
  String sku;
  String name;
  String? description;
  int price;
  int finalPrice;
  int isPromotion;
  int percentDiscount;
  String image;
  List<String>? imagesUrl;
  int stock;
  int display;
  double ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  int? attachProduct;
  int? productDocument;
  Product({
    required this.productId,
    required this.categoryId,
    required this.categoryparentId,
    required this.sku,
    required this.name,
    this.description,
    required this.price,
    required this.finalPrice,
    required this.isPromotion,
    required this.percentDiscount,
    required this.image,
    this.imagesUrl,
    required this.stock,
    required this.display,
    required this.ratingScore,
    required this.ratingCount,
    required this.quantity,
    required this.warranty,
    this.attachProduct,
    this.productDocument,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      categoryId: json['category_id'],
      categoryparentId: json['category_parent_id'],
      sku: json['sku'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      finalPrice: json['final_price'],
      isPromotion: json['is_promotion'],
      percentDiscount: json['percent_discount'],
      image: StringUtil.formatImageUrl(json['image']),
      imagesUrl: json['images_url'] != null
          ? List<String>.from(
              json['images_url'].map((x) => StringUtil.formatImageUrl(x)))
          : null,
      stock: json['stock'],
      display: json['display'],
      ratingScore: json['rating_score'].toDouble(),
      ratingCount: json['rating_count'],
      quantity: json['quantity'],
      warranty: json['warranty'],
      attachProduct: json['attach_product'],
      productDocument: json['product_document'],
    );
  }
}
