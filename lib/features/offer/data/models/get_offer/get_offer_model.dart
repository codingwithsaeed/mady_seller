import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';

part 'get_offer_model.freezed.dart';
part 'get_offer_model.g.dart';

@freezed
class GetOfferModel with _$GetOfferModel {
  const factory GetOfferModel(int success, Offer? offer) = _GetOfferModel;

  factory GetOfferModel.fromJson(Map<String, dynamic> json) =>
      _$GetOfferModelFromJson(json);
}
