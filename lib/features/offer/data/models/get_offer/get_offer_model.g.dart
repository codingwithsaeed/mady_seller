// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetOfferModel _$$_GetOfferModelFromJson(Map<String, dynamic> json) =>
    _$_GetOfferModel(
      json['success'] as int,
      json['offer'] == null
          ? null
          : Offer.fromJson(json['offer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetOfferModelToJson(_$_GetOfferModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'offer': instance.offer,
    };
