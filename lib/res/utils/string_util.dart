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

  static List<String> addStrToArr(List<String> oldArr, String str) {
    List<String> newArr = oldArr;
    if (newArr.contains(str)) {
      newArr.removeWhere((element) => element == str);
    }
    newArr.insert(0, str);
    if (newArr.length > AppConfig.numOfRecentSearchStr) {
      newArr.removeRange(5, oldArr.length - 1);
    }
    return newArr;
  }
}
