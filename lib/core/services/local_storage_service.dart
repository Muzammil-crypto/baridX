import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Save Data (String)
  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  /// Get Data (String)
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  /// Save Data (Boolean)
  Future<void> saveBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  /// Get Data (Boolean)
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  /// Save Data (Integer)
  Future<void> saveInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  /// Get Data (Integer)
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  /// Save Data (Double)
  Future<void> saveDouble(String key, double value) async {
    await _preferences?.setDouble(key, value);
  }

  /// Get Data (Double)
  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  /// Save List of Strings
  Future<void> saveStringList(String key, List<String> values) async {
    await _preferences?.setStringList(key, values);
  }

  /// Get List of Strings
  List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  /// Remove a specific key
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  /// Clear all stored data
  Future<void> clear() async {
    await _preferences?.clear();
  }
}
