// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddOffer _$$_AddOfferFromJson(Map<String, dynamic> json) => _$_AddOffer(
      action: json['action'] as String? ?? 'insert_offer',
      sid: json['sid'] as String?,
      content: json['content'] as String?,
      date: json['date'] as String?,
      sTime: json['sTime'] as String?,
      eTime: json['eTime'] as String?,
      price: json['price'] as String?,
      percent: json['percent'] as String?,
      currentPrice: json['currentPrice'] as String?,
      picture: json['picture'] as String?,
      count: json['count'] as String?,
      isSpecial: json['isSpecial'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_AddOfferToJson(_$_AddOffer instance) =>
    <String, dynamic>{
      'action': instance.action,
      'sid': instance.sid,
      'content': instance.content,
      'date': instance.date,
      'sTime': instance.sTime,
      'eTime': instance.eTime,
      'price': instance.price,
      'percent': instance.percent,
      'currentPrice': instance.currentPrice,
      'picture': instance.picture,
      'count': instance.count,
      'isSpecial': instance.isSpecial,
      'status': instance.status,
    };
