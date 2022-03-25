// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer extends Equatable {
  late String? oid;
  late String? content;
  late String? date;
  late String? sTime;
  late String? eTime;
  late String? price;
  late String? percent;
  late String? currentPrice;
  late String? picture;
  late String? count;
  late String? isSpecial;
  late String? status;

  Offer(
      {this.oid = '',
      this.content = '',
      this.date = '',
      this.sTime = '',
      this.eTime = '',
      this.price = '',
      this.percent = '',
      this.currentPrice = '',
      this.picture = '',
      this.count = '',
      this.isSpecial = '',
      this.status = ''});
  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);

  @override
  List<Object?> get props => [
        oid,
        content,
        date,
        sTime,
        eTime,
        price,
        percent,
        currentPrice,
        picture,
        count,
        isSpecial,
        status
      ];
}
