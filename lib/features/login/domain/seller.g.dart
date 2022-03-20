// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Seller _$$_SellerFromJson(Map<String, dynamic> json) => _$_Seller(
      json['sid'] as String,
      json['storeName'] as String,
      json['phone'] as String,
      json['category'] as String,
      json['address'] as String,
      json['website'] as String,
      json['logo'] as String,
      json['lat'] as String,
      json['lng'] as String,
      json['pocket'] as String,
      json['offerCount'] as String,
      json['expire'] as String,
      json['hasSpecial'] as String,
      json['specialCount'] as String,
    );

Map<String, dynamic> _$$_SellerToJson(_$_Seller instance) => <String, dynamic>{
      'sid': instance.sid,
      'storeName': instance.storeName,
      'phone': instance.phone,
      'category': instance.category,
      'address': instance.address,
      'website': instance.website,
      'logo': instance.logo,
      'lat': instance.lat,
      'lng': instance.lng,
      'pocket': instance.pocket,
      'offerCount': instance.offerCount,
      'expire': instance.expire,
      'hasSpecial': instance.hasSpecial,
      'specialCount': instance.specialCount,
    };
