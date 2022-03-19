import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheProvider {
  Future<bool?> getBool(String key);
  Future<void> setBool(String key, bool value);
}

class CacheProviderImpl implements CacheProvider {
  CacheProviderImpl._internal();

  static final CacheProviderImpl _singleton = CacheProviderImpl._internal();

  factory CacheProviderImpl() => _singleton;

  late SharedPreferences _preferences;

  @override
  Future<bool?> getBool(String key) async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setBool(key, value);
  }
}
