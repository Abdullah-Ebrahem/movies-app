import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static saveNotFirstTime() async {
    await _prefs.setBool('notFirstTime', false);
  }

  static bool getIfFirstTime() => _prefs.getBool('notFirstTime') ?? true;

  static saveEmail({required String email}) async {
    await _prefs.setString('email', email);
  }

  static String getEmail() => _prefs.getString('email') ?? '';

  static saveFirstName({required String firstName}) async {
    await _prefs.setString('firstName', firstName);
  }

  static String getFirstName() => _prefs.getString('firstName') ?? '';

  static saveLastName({required String lastName}) async {
    await _prefs.setString('lastName', lastName);
  }

  static String getLastName() => _prefs.getString('lastName') ?? '';

  static saveMovies(List<String> movies) async {
    await _prefs.setStringList('movies', movies);
  }

  static List<String> getMovies() =>
      _prefs.getStringList('movies') ?? ['nothing'];

  static void clear() {
    _prefs.clear();
  }
}
