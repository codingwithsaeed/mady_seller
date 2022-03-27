import 'package:freezed_annotation/freezed_annotation.dart';

part 'deter_offer_model.freezed.dart';
part 'deter_offer_model.g.dart';

@freezed
class DeterOfferModel with _$DeterOfferModel {
  const factory DeterOfferModel(int success, String? error) = _DeterOfferModel;

  factory DeterOfferModel.fromJson(Map<String, dynamic> json) =>
      _$DeterOfferModelFromJson(json);
}
