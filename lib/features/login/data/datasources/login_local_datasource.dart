import 'package:mady_seller/core/cache/cache_provider.dart';

abstract class LoginLocalDatasource {
  ///Sets a true value for LOGIN in SharedPrefrences
  Future<void> saveLogin();
}

class LoginLocalDatasourceImpl implements LoginLocalDatasource {
  final CacheProvider _cacheProvider;

  LoginLocalDatasourceImpl(this._cacheProvider);

  @override
  Future<void> saveLogin() async {
    await _cacheProvider.setBool('LOGIN', true);
  }
}
