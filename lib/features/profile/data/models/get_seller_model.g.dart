// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetSellerModel _$$_GetSellerModelFromJson(Map<String, dynamic> json) =>
    _$_GetSellerModel(
      success: json['success'] as int,
      data: json['data'] == null
          ? null
          : Seller.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetSellerModelToJson(_$_GetSellerModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
