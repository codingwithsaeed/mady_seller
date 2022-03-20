import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@freezed
class Seller with _$Seller {
  const factory Seller(
    String sid,
    String storeName,
    String phone,
    String category,
    String address,
    String website,
    String logo,
    String lat,
    String lng,
    String pocket,
    String offerCount,
    String expire,
    String hasSpecial,
    String specialCount,
  ) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
