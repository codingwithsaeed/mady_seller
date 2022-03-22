// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Offer _$$_OfferFromJson(Map<String, dynamic> json) => _$_Offer(
      oid: json['oid'] as String,
      content: json['content'] as String,
      date: json['date'] as String,
      sTime: json['sTime'] as String,
      eTime: json['eTime'] as String,
      price: json['price'] as String,
      percent: json['percent'] as String,
      currentPrice: json['currentPrice'] as String,
      picture: json['picture'] as String,
      count: json['count'] as String,
      status: json['status'] as String,
      isSpecial: json['isSpecial'] as String,
    );

Map<String, dynamic> _$$_OfferToJson(_$_Offer instance) => <String, dynamic>{
      'oid': instance.oid,
      'content': instance.content,
      'date': instance.date,
      'sTime': instance.sTime,
      'eTime': instance.eTime,
      'price': instance.price,
      'percent': instance.percent,
      'currentPrice': instance.currentPrice,
      'picture': instance.picture,
      'count': instance.count,
      'status': instance.status,
      'isSpecial': instance.isSpecial,
    };
