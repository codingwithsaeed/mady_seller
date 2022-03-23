import 'dart:convert';

import 'package:mady_seller/core/nework/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/offer/data/models/add_offer/add_offer_model.dart';

abstract class AddOfferRemoteDataSource {
  ///Performs a POST request to the [currentDataUrl]
  ///throws a [ServerException] on all errors
  Future<AddOfferModel> addOffer(Map<String, dynamic> params);
}

class AddOfferRemoteDataSourceImpl implements AddOfferRemoteDataSource {
  final ApiProvider _apiProvider;

  AddOfferRemoteDataSourceImpl(this._apiProvider);
  @override
  Future<AddOfferModel> addOffer(Map<String, dynamic> params) async {
    final result = await _apiProvider.post(currentDataUrl, params: params);
    return AddOfferModel.fromJson(jsonDecode(result.body));
  }
}
