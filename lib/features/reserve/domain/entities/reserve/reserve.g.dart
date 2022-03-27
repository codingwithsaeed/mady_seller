// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reserve _$$_ReserveFromJson(Map<String, dynamic> json) => _$_Reserve(
      json['rid'] as String,
      json['oid'] as String,
      json['name'] as String,
      json['count'] as String,
      json['receipt'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$$_ReserveToJson(_$_Reserve instance) =>
    <String, dynamic>{
      'rid': instance.rid,
      'oid': instance.oid,
      'name': instance.name,
      'count': instance.count,
      'receipt': instance.receipt,
      'status': instance.status,
    };
