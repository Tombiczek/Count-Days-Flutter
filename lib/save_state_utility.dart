import 'package:shared_preferences/shared_preferences.dart';

class SaveStateUtility {

    // DATE_INIT: SAVE, LOAD, DELETE

  static const String dateInitKey = 'dateInit';

  static Future<void> saveDateInit(DateTime dateInit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dateInit', dateInit.toIso8601String());
  }

  static Future<DateTime?> loadDateInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dateInitString = prefs.getString('dateInit');
    return dateInitString != null ? DateTime.parse(dateInitString) : null;
  }

  static Future<void> clearDateInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(dateInitKey);
  }


  // TITLE: SAVE, LOAD, DELETE

  static const String titleKey = 'title';

  static Future<void> saveTitle(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', title);
  }

  static Future<String?> loadTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? titleString = prefs.getString('title');
    return titleString;
  }

  static Future<void> clearTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(titleKey);
  }
}
