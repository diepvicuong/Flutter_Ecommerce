class AppConfig {
  static final String baseUrl = 'https://trongnv.me';
  static final String homeUrl = baseUrl + '/api/home';
  static String productListUrl(int categoryId) =>
      baseUrl + '/api/product/category/${categoryId}';
}
