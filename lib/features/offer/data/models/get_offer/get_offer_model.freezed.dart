// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetOfferModel _$GetOfferModelFromJson(Map<String, dynamic> json) {
  return _GetOfferModel.fromJson(json);
}

/// @nodoc
class _$GetOfferModelTearOff {
  const _$GetOfferModelTearOff();

  _GetOfferModel call(int success, Offer? offer) {
    return _GetOfferModel(
      success,
      offer,
    );
  }

  GetOfferModel fromJson(Map<String, Object?> json) {
    return GetOfferModel.fromJson(json);
  }
}

/// @nodoc
const $GetOfferModel = _$GetOfferModelTearOff();

/// @nodoc
mixin _$GetOfferModel {
  int get success => throw _privateConstructorUsedError;
  Offer? get offer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOfferModelCopyWith<GetOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOfferModelCopyWith<$Res> {
  factory $GetOfferModelCopyWith(
          GetOfferModel value, $Res Function(GetOfferModel) then) =
      _$GetOfferModelCopyWithImpl<$Res>;
  $Res call({int success, Offer? offer});
}

/// @nodoc
class _$GetOfferModelCopyWithImpl<$Res>
    implements $GetOfferModelCopyWith<$Res> {
  _$GetOfferModelCopyWithImpl(this._value, this._then);

  final GetOfferModel _value;
  // ignore: unused_field
  final $Res Function(GetOfferModel) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? offer = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      offer: offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer?,
    ));
  }
}

/// @nodoc
abstract class _$GetOfferModelCopyWith<$Res>
    implements $GetOfferModelCopyWith<$Res> {
  factory _$GetOfferModelCopyWith(
          _GetOfferModel value, $Res Function(_GetOfferModel) then) =
      __$GetOfferModelCopyWithImpl<$Res>;
  @override
  $Res call({int success, Offer? offer});
}

/// @nodoc
class __$GetOfferModelCopyWithImpl<$Res>
    extends _$GetOfferModelCopyWithImpl<$Res>
    implements _$GetOfferModelCopyWith<$Res> {
  __$GetOfferModelCopyWithImpl(
      _GetOfferModel _value, $Res Function(_GetOfferModel) _then)
      : super(_value, (v) => _then(v as _GetOfferModel));

  @override
  _GetOfferModel get _value => super._value as _GetOfferModel;

  @override
  $Res call({
    Object? success = freezed,
    Object? offer = freezed,
  }) {
    return _then(_GetOfferModel(
      success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      offer == freezed
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Offer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetOfferModel implements _GetOfferModel {
  const _$_GetOfferModel(this.success, this.offer);

  factory _$_GetOfferModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetOfferModelFromJson(json);

  @override
  final int success;
  @override
  final Offer? offer;

  @override
  String toString() {
    return 'GetOfferModel(success: $success, offer: $offer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetOfferModel &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.offer, offer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(offer));

  @JsonKey(ignore: true)
  @override
  _$GetOfferModelCopyWith<_GetOfferModel> get copyWith =>
      __$GetOfferModelCopyWithImpl<_GetOfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetOfferModelToJson(this);
  }
}

abstract class _GetOfferModel implements GetOfferModel {
  const factory _GetOfferModel(int success, Offer? offer) = _$_GetOfferModel;

  factory _GetOfferModel.fromJson(Map<String, dynamic> json) =
      _$_GetOfferModel.fromJson;

  @override
  int get success;
  @override
  Offer? get offer;
  @override
  @JsonKey(ignore: true)
  _$GetOfferModelCopyWith<_GetOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}
