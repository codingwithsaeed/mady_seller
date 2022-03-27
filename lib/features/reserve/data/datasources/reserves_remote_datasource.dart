import 'dart:convert';

import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/reserve/data/models/get_reserves_model/get_reserves_model.dart';

abstract class ReservesRemoteDatasource {
  Future<GetReservesModel> getReserves(Map<String, dynamic> params);
}

class ReservesRemoteDatasourceImpl implements ReservesRemoteDatasource {
  final ApiProvider _apiProvider;

  ReservesRemoteDatasourceImpl(this._apiProvider);

  @override
  Future<GetReservesModel> getReserves(Map<String, dynamic> params) async {
    final response = await _apiProvider.post(currentDataUrl, params: params);
    var reserves = GetReservesModel.fromJson(jsonDecode(response.body));
    return reserves;
  }
}
