import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';

abstract class SplashDatasource {
  /// Uses a shared prefrences to determine if user is logged in
  /// Throws a [CacheException] on all errors
  bool isLoggedIn();
}

class SplashDatasourceImpl implements SplashDatasource {
  final GetStorage _storage;

  const SplashDatasourceImpl(this._storage);

  @override
  bool isLoggedIn() {
    final result = _storage.read('id');
    if (result == null) throw const CacheException(Failure.notFound);
    return true;
  }
}
