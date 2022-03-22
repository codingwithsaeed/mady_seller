import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

@freezed
class Offer with _$Offer {
  const factory Offer({
    required String oid,
    required String content,
    required String date,
    required String sTime,
    required String eTime,
    required String price,
    required String percent,
    required String currentPrice,
    required String picture,
    required String count,
    required String status,
    required String isSpecial,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
