import 'package:shared_preferences/shared_preferences.dart';

///缓存管理类

class KkCache {
  SharedPreferences? prefs;
  static KkCache? _instance;

  KkCache._pre(this.prefs);
  KkCache._() {
    init();
  }
  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  static Future<KkCache?> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = KkCache._pre(prefs);
    }
    return _instance;
  }

  static KkCache getInstance() {
    _instance ??= KkCache._();
    return _instance!;
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  remove(String key) {
    prefs?.remove(key);
  }

  T? get<T>(String key) {
    var result = prefs?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
