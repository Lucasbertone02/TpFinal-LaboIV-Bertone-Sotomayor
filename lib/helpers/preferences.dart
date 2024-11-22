import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static bool _darkmode = false;
  static late SharedPreferences _prefs;

  /// Inicializa las preferencias compartidas
  static Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Obtiene el valor del modo oscuro
  static bool get darkmode {
    return _prefs.getBool('darkmode') ?? _darkmode;
  }

  /// Establece el valor del modo oscuro
  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }
}
