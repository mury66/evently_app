import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setOnBoardingSeen(bool seen) async {
    await _prefs?.setBool('onBoardingSeen', seen);
  }

  static bool getOnBoardingSeen() {
    return _prefs?.getBool('onBoardingSeen') ?? false;
  }

  static Future<void> setDarkMode(bool isDarkMode) async {
    await _prefs?.setBool('isDarkMode', isDarkMode);
  }

  static bool getDarkMode() {
    return _prefs?.getBool('isDarkMode') ?? false;
  }

  static Future<void> setLanguage(String languageCode) async {
    await _prefs?.setString('languageCode', languageCode);
  }

  static String getLanguage() {
    return _prefs?.getString('languageCode') ?? 'en';
  }
}
