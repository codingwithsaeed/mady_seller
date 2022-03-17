import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashDatasource {
  /// Uses a shared prefrences to determine if user is logged in
  /// Throws a [CacheException] on all errors
  bool isLoggedIn();
}

class SplashDatasourceImpl implements SplashDatasource {
  final SharedPreferences _sharedPreferences;

  SplashDatasourceImpl(this._sharedPreferences);
  @override
  bool isLoggedIn() {
    final result = _sharedPreferences.getBool('LOGIN');
    if (result == null) throw const CacheException(Failure.notFound);
    return result;
  }
}
