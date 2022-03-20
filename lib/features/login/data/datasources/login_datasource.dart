import 'dart:convert';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/nework/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/login/data/models/seller_model.dart';

abstract class LoginDatasource {
  ///Performs a POST request to url
  ///returns a [ServerException] on all errors
  Future<SellerModel> doLogin(Map<String, dynamic> params);
}

class LoginDatasourceImpl implements LoginDatasource {
  final ApiProvider _apiProvider;

  LoginDatasourceImpl(this._apiProvider);

  @override
  Future<SellerModel> doLogin(Map<String, dynamic> params) async {
    final result = await _apiProvider.post(currentDataUrl, params: params);
    if (result.statusCode == 200) {
      return SellerModel.fromJson(jsonDecode(result.body));
    }
    throw ServerException('خطای سرور ${result.statusCode}');
  }
}
