
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';

part 'seller_model.freezed.dart';
part 'seller_model.g.dart';

@freezed
class SellerModel with _$SellerModel {
  const factory SellerModel({required int success, Seller? data}) = _SellerModel;

  factory SellerModel.fromJson(Map<String, dynamic> json) => _$SellerModelFromJson(json);
}