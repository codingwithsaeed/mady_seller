import 'dart:convert';

import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/offer/data/models/get_offer/get_offer_model.dart';

abstract class SingleOfferRemoteDatasource {
  Future<bool> updateOffer(Map<String, dynamic> params);

  Future<GetOfferModel> getOffer(Map<String, dynamic> params);
}

class SingleOfferRemoteDatasourceImpl implements SingleOfferRemoteDatasource {
  final ApiProvider _apiProvider;

  SingleOfferRemoteDatasourceImpl(this._apiProvider);

  @override
  Future<bool> updateOffer(Map<String, dynamic> params) async {
    final response = await _apiProvider.post(currentDataUrl, params: params);
    final result = jsonDecode(response.body);
    if (result['success'] == 1) return true;
    return false;
  }

  @override
  Future<GetOfferModel> getOffer(Map<String, dynamic> params) async {
    final response = await _apiProvider.post(currentDataUrl, params: params);
    final result = GetOfferModel.fromJson(jsonDecode(response.body));
    return result;
  }
}
