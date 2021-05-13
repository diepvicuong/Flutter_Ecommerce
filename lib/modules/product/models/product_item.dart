class ProductItem {
  String imageUrl;
  String name;
  double currentPrice;
  double? oldPrice;
  double star;
  int? salePercent;

  ProductItem(
      {required this.imageUrl,
      required this.name,
      required this.currentPrice,
      this.oldPrice,
      this.star = 0.0,
      this.salePercent});
}
