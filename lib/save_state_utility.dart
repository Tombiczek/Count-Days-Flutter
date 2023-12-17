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


      // DATE_START: SAVE, LOAD, DELETE

  static const String dateStartKey = 'dateStart';

  static Future<void> saveDateStart(DateTime dateStart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dateStart', dateStart.toIso8601String());
  }

  static Future<DateTime?> loadDateStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dateStartString = prefs.getString('dateStart');
    return dateStartString != null ? DateTime.parse(dateStartString) : null;
  }

  static Future<void> clearDateStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(dateStartKey);
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


   // ROUND UP: SAVE, LOAD

  static Future<void> saveRoundUpValue(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('roundUp', value);
  }

  static Future<bool?> loadRoundUpValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? boolean = prefs.getBool('roundUp');
  return boolean;
  }

  // THEME: SAVE, LOAD

  static Future<void> saveThemeValue(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('theme', value);
  }

  static Future<bool?> loadThemeValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? boolean = prefs.getBool('theme');
  return boolean;
  }


  // ORANGE: SAVE, LOAD

  static Future<void> saveOrangeValue(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('orange', value);
  }

  static Future<bool?> loadOrangeValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? boolean = prefs.getBool('orange');
  return boolean;
  }
}
