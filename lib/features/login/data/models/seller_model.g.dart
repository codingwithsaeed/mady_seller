// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SellerModel _$$_SellerModelFromJson(Map<String, dynamic> json) =>
    _$_SellerModel(
      success: json['success'] as int,
      data: json['data'] == null
          ? null
          : Seller.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SellerModelToJson(_$_SellerModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
