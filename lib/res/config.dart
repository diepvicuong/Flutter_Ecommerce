class AppConfig {
  static final String baseUrl = 'https://trongnv.me';
  static final String homeUrl = baseUrl + '/api/home';
  static String productListUrl(int categoryId) =>
      baseUrl + '/api/product/category/${categoryId}';
  static String productDetailUrl(int productId) =>
      baseUrl + '/api/product/detail/${productId}';

  static String productListSearchUrl(String str) =>
      baseUrl + '/api/product/search?q=$str';
}
