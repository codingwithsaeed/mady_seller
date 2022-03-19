import 'package:mady_seller/core/cache/cache_provider.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';

abstract class SplashDatasource {
  /// Uses a shared prefrences to determine if user is logged in
  /// Throws a [CacheException] on all errors
  Future<bool> isLoggedIn();
}

class SplashDatasourceImpl implements SplashDatasource {
  
  const SplashDatasourceImpl();
  @override
  Future<bool> isLoggedIn() async {
    final result = await CacheProviderImpl().getBool('LOGIN');
    if (result == null) throw const CacheException(Failure.notFound);
    return result;
  }
}
