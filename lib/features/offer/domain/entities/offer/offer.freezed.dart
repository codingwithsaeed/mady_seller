// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return _Offer.fromJson(json);
}

/// @nodoc
class _$OfferTearOff {
  const _$OfferTearOff();

  _Offer call(
      {required String oid,
      required String content,
      required String date,
      required String sTime,
      required String eTime,
      required String price,
      required String percent,
      required String currentPrice,
      required String picture,
      required String count,
      required String status,
      required String isSpecial}) {
    return _Offer(
      oid: oid,
      content: content,
      date: date,
      sTime: sTime,
      eTime: eTime,
      price: price,
      percent: percent,
      currentPrice: currentPrice,
      picture: picture,
      count: count,
      status: status,
      isSpecial: isSpecial,
    );
  }

  Offer fromJson(Map<String, Object?> json) {
    return Offer.fromJson(json);
  }
}

/// @nodoc
const $Offer = _$OfferTearOff();

/// @nodoc
mixin _$Offer {
  String get oid => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get sTime => throw _privateConstructorUsedError;
  String get eTime => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get percent => throw _privateConstructorUsedError;
  String get currentPrice => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  String get count => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get isSpecial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferCopyWith<Offer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) then) =
      _$OfferCopyWithImpl<$Res>;
  $Res call(
      {String oid,
      String content,
      String date,
      String sTime,
      String eTime,
      String price,
      String percent,
      String currentPrice,
      String picture,
      String count,
      String status,
      String isSpecial});
}

/// @nodoc
class _$OfferCopyWithImpl<$Res> implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._value, this._then);

  final Offer _value;
  // ignore: unused_field
  final $Res Function(Offer) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? content = freezed,
    Object? date = freezed,
    Object? sTime = freezed,
    Object? eTime = freezed,
    Object? price = freezed,
    Object? percent = freezed,
    Object? currentPrice = freezed,
    Object? picture = freezed,
    Object? count = freezed,
    Object? status = freezed,
    Object? isSpecial = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sTime: sTime == freezed
          ? _value.sTime
          : sTime // ignore: cast_nullable_to_non_nullable
              as String,
      eTime: eTime == freezed
          ? _value.eTime
          : eTime // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      percent: percent == freezed
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isSpecial: isSpecial == freezed
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OfferCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$OfferCopyWith(_Offer value, $Res Function(_Offer) then) =
      __$OfferCopyWithImpl<$Res>;
  @override
  $Res call(
      {String oid,
      String content,
      String date,
      String sTime,
      String eTime,
      String price,
      String percent,
      String currentPrice,
      String picture,
      String count,
      String status,
      String isSpecial});
}

/// @nodoc
class __$OfferCopyWithImpl<$Res> extends _$OfferCopyWithImpl<$Res>
    implements _$OfferCopyWith<$Res> {
  __$OfferCopyWithImpl(_Offer _value, $Res Function(_Offer) _then)
      : super(_value, (v) => _then(v as _Offer));

  @override
  _Offer get _value => super._value as _Offer;

  @override
  $Res call({
    Object? oid = freezed,
    Object? content = freezed,
    Object? date = freezed,
    Object? sTime = freezed,
    Object? eTime = freezed,
    Object? price = freezed,
    Object? percent = freezed,
    Object? currentPrice = freezed,
    Object? picture = freezed,
    Object? count = freezed,
    Object? status = freezed,
    Object? isSpecial = freezed,
  }) {
    return _then(_Offer(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sTime: sTime == freezed
          ? _value.sTime
          : sTime // ignore: cast_nullable_to_non_nullable
              as String,
      eTime: eTime == freezed
          ? _value.eTime
          : eTime // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      percent: percent == freezed
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isSpecial: isSpecial == freezed
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Offer implements _Offer {
  const _$_Offer(
      {required this.oid,
      required this.content,
      required this.date,
      required this.sTime,
      required this.eTime,
      required this.price,
      required this.percent,
      required this.currentPrice,
      required this.picture,
      required this.count,
      required this.status,
      required this.isSpecial});

  factory _$_Offer.fromJson(Map<String, dynamic> json) =>
      _$$_OfferFromJson(json);

  @override
  final String oid;
  @override
  final String content;
  @override
  final String date;
  @override
  final String sTime;
  @override
  final String eTime;
  @override
  final String price;
  @override
  final String percent;
  @override
  final String currentPrice;
  @override
  final String picture;
  @override
  final String count;
  @override
  final String status;
  @override
  final String isSpecial;

  @override
  String toString() {
    return 'Offer(oid: $oid, content: $content, date: $date, sTime: $sTime, eTime: $eTime, price: $price, percent: $percent, currentPrice: $currentPrice, picture: $picture, count: $count, status: $status, isSpecial: $isSpecial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Offer &&
            const DeepCollectionEquality().equals(other.oid, oid) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.sTime, sTime) &&
            const DeepCollectionEquality().equals(other.eTime, eTime) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.percent, percent) &&
            const DeepCollectionEquality()
                .equals(other.currentPrice, currentPrice) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.isSpecial, isSpecial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(oid),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(sTime),
      const DeepCollectionEquality().hash(eTime),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(percent),
      const DeepCollectionEquality().hash(currentPrice),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(isSpecial));

  @JsonKey(ignore: true)
  @override
  _$OfferCopyWith<_Offer> get copyWith =>
      __$OfferCopyWithImpl<_Offer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferToJson(this);
  }
}

abstract class _Offer implements Offer {
  const factory _Offer(
      {required String oid,
      required String content,
      required String date,
      required String sTime,
      required String eTime,
      required String price,
      required String percent,
      required String currentPrice,
      required String picture,
      required String count,
      required String status,
      required String isSpecial}) = _$_Offer;

  factory _Offer.fromJson(Map<String, dynamic> json) = _$_Offer.fromJson;

  @override
  String get oid;
  @override
  String get content;
  @override
  String get date;
  @override
  String get sTime;
  @override
  String get eTime;
  @override
  String get price;
  @override
  String get percent;
  @override
  String get currentPrice;
  @override
  String get picture;
  @override
  String get count;
  @override
  String get status;
  @override
  String get isSpecial;
  @override
  @JsonKey(ignore: true)
  _$OfferCopyWith<_Offer> get copyWith => throw _privateConstructorUsedError;
}
