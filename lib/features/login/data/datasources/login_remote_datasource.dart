import 'dart:convert';

import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/login/data/models/seller_model.dart';

abstract class LoginRemoteDatasource {
  ///Performs a POST request to url
  ///returns a [ServerException] on all errors
  Future<SellerModel> doLogin(Map<String, dynamic> params);
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final ApiProvider _apiProvider;

  LoginRemoteDatasourceImpl(this._apiProvider);

  @override
  Future<SellerModel> doLogin(Map<String, dynamic> params) async {
    final result = await _apiProvider.post(currentDataUrl, params: params);
    return SellerModel.fromJson(jsonDecode(result.body));
  }
}
