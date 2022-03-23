import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_offer.freezed.dart';
part 'add_offer.g.dart';

@freezed
class AddOffer with _$AddOffer {
  const factory AddOffer({
    @Default('insert_offer') String action,
    String? sid,
    String? content,
    String? date,
    String? sTime,
    String? eTime,
    String? price,
    String? percent,
    String? currentPrice,
    String? picture,
    String? count,
    String? isSpecial,
    String? status,
  }) = _AddOffer;

  factory AddOffer.fromJson(Map<String, dynamic> json) =>
      _$AddOfferFromJson(json);
}
