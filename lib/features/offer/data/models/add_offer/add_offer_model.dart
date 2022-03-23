import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_offer_model.freezed.dart';
part 'add_offer_model.g.dart';

@freezed
class AddOfferModel with _$AddOfferModel {
  const factory AddOfferModel({required int success, String? error}) =
      _AddOfferModel;

  factory AddOfferModel.fromJson(Map<String, dynamic> json) =>
      _$AddOfferModelFromJson(json);
}
