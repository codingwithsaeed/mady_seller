import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@freezed
class Seller with _$Seller {
  const factory Seller({
    required String sid,
    required String storeName,
    required String phone,
    required String category,
    required String address,
    required String website,
    required String logo,
    required String lat,
    required String lng,
    required String pocket,
    required String offerCount,
    required String expire,
    required String hasSpecial,
    required String specialCount,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
