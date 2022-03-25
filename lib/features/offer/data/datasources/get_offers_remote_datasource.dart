import 'dart:convert';

import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/offer/data/models/get_offers/get_offers_model.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';

abstract class GetOffersRemoteDatasource {
  ///Performs a POST request to the [currentDataUrl]
  ///throws a [ServerException] on all errors
  Future<List<Offer>> getOffers(Map<String, dynamic> params);
}

class GetOffersRemoteDatasourceImpl implements GetOffersRemoteDatasource {
  final ApiProvider _apiProvider;

  GetOffersRemoteDatasourceImpl(this._apiProvider);

  @override
  Future<List<Offer>> getOffers(Map<String, dynamic> params) async {
    final result = await _apiProvider.post(currentDataUrl, params: params);
    return GetOffersModel.fromJson(jsonDecode(result.body)).offers;
  }
}
