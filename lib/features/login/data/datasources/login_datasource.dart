import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/features/login/data/models/seller_model.dart';

abstract class LoginDatasource {
  ///Performs a POST request to url
  ///returns a [ServerException] on all errors
  Future<SellerModel> doLogin(Map<String, dynamic> params);
}

class LoginDatasourceImpl implements LoginDatasource{
  @override
  Future<SellerModel> doLogin(Map<String, dynamic> params) {
    // TODO: implement doLogin
    throw UnimplementedError();
  }
  
}
