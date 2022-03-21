import 'package:get_storage/get_storage.dart';

abstract class GetSellerLocalDatasource {
  ///Try to get the seller id that saved in GetStorage
  ///throws a [CacheException] on all errors
  String? getSellerId();
}

class GetSellerLocalDatasourceImpl implements GetSellerLocalDatasource {
  final GetStorage _storage;

  GetSellerLocalDatasourceImpl(this._storage);

  @override
  String? getSellerId() {
    return _storage.read<String>('id');
  }
}
