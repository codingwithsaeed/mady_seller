// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Seller _$$_SellerFromJson(Map<String, dynamic> json) => _$_Seller(
      sid: json['sid'] as String,
      storeName: json['storeName'] as String,
      phone: json['phone'] as String,
      category: json['category'] as String,
      address: json['address'] as String,
      website: json['website'] as String,
      logo: json['logo'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      pocket: json['pocket'] as String,
      offerCount: json['offerCount'] as String,
      expire: json['expire'] as String,
      hasSpecial: json['hasSpecial'] as String,
      specialCount: json['specialCount'] as String,
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
