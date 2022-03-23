import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';

part 'get_offers_model.freezed.dart';
part 'get_offers_model.g.dart';

@freezed
class GetOffersModel with _$GetOffersModel {
  const factory GetOffersModel(
    {
      required List<Offer> offers,
    }
  ) = _GetOffersModel;

  factory GetOffersModel.fromJson(Map<String, dynamic> json) => _$GetOffersModelFromJson(json);
}
