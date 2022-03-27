// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reserves_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetReservesModel _$$_GetReservesModelFromJson(Map<String, dynamic> json) =>
    _$_GetReservesModel(
      json['success'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => Reserve.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetReservesModelToJson(_$_GetReservesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
