

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';

part 'get_seller_model.freezed.dart';
part 'get_seller_model.g.dart';

@freezed
class GetSellerModel with _$GetSellerModel {
  const factory GetSellerModel(
    {
      required int success,
      Seller? data,
    }
  ) = _GetSellerModel;

  factory GetSellerModel.fromJson(Map<String, dynamic> json) => _$GetSellerModelFromJson(json);
}