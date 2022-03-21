import 'package:get_storage/get_storage.dart';

abstract class LoginLocalDatasource {
  ///Sets a true value for LOGIN in GetStorage
  Future<void> saveSellerId(String sellerId);
}

class LoginLocalDatasourceImpl implements LoginLocalDatasource {
  final GetStorage _storage;

  LoginLocalDatasourceImpl(this._storage);

  @override
  Future<void> saveSellerId(String sellerId) async {
     await _storage.write('id', sellerId);
  }
}
