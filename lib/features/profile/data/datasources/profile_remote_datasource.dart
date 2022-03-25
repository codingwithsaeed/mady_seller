import 'dart:convert';

import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/profile/data/models/get_seller_model.dart';

abstract class ProfileRemoteDatasource {
  Future<Seller> getSeller(Map<String, dynamic> params);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final ApiProvider _apiProvider;

  ProfileRemoteDatasourceImpl(this._apiProvider);

  @override
  Future<Seller> getSeller(Map<String, dynamic> params) async {
    final result = await _apiProvider.post(currentDataUrl, params: params);
    var model = GetSellerModel.fromJson(jsonDecode(result.body));
    if (model.success == 1) return model.data!;
    throw const ServerException(Failure.notFound);
  }
}
