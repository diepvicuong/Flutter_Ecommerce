import 'package:shared_preferences/shared_preferences.dart';

const String listSearchRecentKey = 'listSearchRecentKey';

class SharedPreference {
  static void setSearchRecent(List<String> strArr) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList(listSearchRecentKey, strArr);
  }

  static Future<List<String>> getSearchRecent() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getStringList(listSearchRecentKey) ?? [];
  }
}
