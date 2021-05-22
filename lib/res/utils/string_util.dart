import 'package:nordic_ecommerce/res/config.dart';

class StringUtil {
  static String formatImageUrl(String? url) {
    if (url == null) {
      return '';
    }
    if (url.contains('http')) {
      return url;
    } else {
      return AppConfig.baseUrl + url;
    }
  }
}
