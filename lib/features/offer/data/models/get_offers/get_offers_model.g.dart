// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetOffersModel _$$_GetOffersModelFromJson(Map<String, dynamic> json) =>
    _$_GetOffersModel(
      offers: (json['offers'] as List<dynamic>)
          .map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetOffersModelToJson(_$_GetOffersModel instance) =>
    <String, dynamic>{
      'offers': instance.offers,
    };
