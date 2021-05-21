class HomePromotionProduct {
  int productId;
  int categoryId;
  int categoryparentId;
  String sku;
  String name;
  String description;
  int price;
  int finalPrice;
  int isPromotion;
  int percentDiscount;
  String image;
  String? imagesUrl;
  int stock;
  int display;
  int ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  int? attachProduct;
  int? productDocument;
  HomePromotionProduct({
    required this.productId,
    required this.categoryId,
    required this.categoryparentId,
    required this.sku,
    required this.name,
    required this.description,
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

  factory HomePromotionProduct.fromJson(Map<String, dynamic> json) {
    return HomePromotionProduct(
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
      image: json['image'],
      imagesUrl: json['images_url'],
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
