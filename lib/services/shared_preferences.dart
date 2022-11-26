import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? prefs;

  static const themeKey = 'theme';

  static Future<SharedPreferences> get getPrefs async {
    prefs ??= await SharedPreferences.getInstance();

    return prefs!;
  }

  static Future<String?> getTheme() async {
    return (await getPrefs).getString(themeKey);
  }

  static Future<void> setTheme(String theme) async {
    await (await getPrefs).setString(themeKey, theme);
  }
}
