// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_offers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetOffersModel _$GetOffersModelFromJson(Map<String, dynamic> json) {
  return _GetOffersModel.fromJson(json);
}

/// @nodoc
class _$GetOffersModelTearOff {
  const _$GetOffersModelTearOff();

  _GetOffersModel call({required List<Offer> offers}) {
    return _GetOffersModel(
      offers: offers,
    );
  }

  GetOffersModel fromJson(Map<String, Object?> json) {
    return GetOffersModel.fromJson(json);
  }
}

/// @nodoc
const $GetOffersModel = _$GetOffersModelTearOff();

/// @nodoc
mixin _$GetOffersModel {
  List<Offer> get offers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOffersModelCopyWith<GetOffersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOffersModelCopyWith<$Res> {
  factory $GetOffersModelCopyWith(
          GetOffersModel value, $Res Function(GetOffersModel) then) =
      _$GetOffersModelCopyWithImpl<$Res>;
  $Res call({List<Offer> offers});
}

/// @nodoc
class _$GetOffersModelCopyWithImpl<$Res>
    implements $GetOffersModelCopyWith<$Res> {
  _$GetOffersModelCopyWithImpl(this._value, this._then);

  final GetOffersModel _value;
  // ignore: unused_field
  final $Res Function(GetOffersModel) _then;

  @override
  $Res call({
    Object? offers = freezed,
  }) {
    return _then(_value.copyWith(
      offers: offers == freezed
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<Offer>,
    ));
  }
}

/// @nodoc
abstract class _$GetOffersModelCopyWith<$Res>
    implements $GetOffersModelCopyWith<$Res> {
  factory _$GetOffersModelCopyWith(
          _GetOffersModel value, $Res Function(_GetOffersModel) then) =
      __$GetOffersModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Offer> offers});
}

/// @nodoc
class __$GetOffersModelCopyWithImpl<$Res>
    extends _$GetOffersModelCopyWithImpl<$Res>
    implements _$GetOffersModelCopyWith<$Res> {
  __$GetOffersModelCopyWithImpl(
      _GetOffersModel _value, $Res Function(_GetOffersModel) _then)
      : super(_value, (v) => _then(v as _GetOffersModel));

  @override
  _GetOffersModel get _value => super._value as _GetOffersModel;

  @override
  $Res call({
    Object? offers = freezed,
  }) {
    return _then(_GetOffersModel(
      offers: offers == freezed
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<Offer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetOffersModel implements _GetOffersModel {
  const _$_GetOffersModel({required this.offers});

  factory _$_GetOffersModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetOffersModelFromJson(json);

  @override
  final List<Offer> offers;

  @override
  String toString() {
    return 'GetOffersModel(offers: $offers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetOffersModel &&
            const DeepCollectionEquality().equals(other.offers, offers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(offers));

  @JsonKey(ignore: true)
  @override
  _$GetOffersModelCopyWith<_GetOffersModel> get copyWith =>
      __$GetOffersModelCopyWithImpl<_GetOffersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetOffersModelToJson(this);
  }
}

abstract class _GetOffersModel implements GetOffersModel {
  const factory _GetOffersModel({required List<Offer> offers}) =
      _$_GetOffersModel;

  factory _GetOffersModel.fromJson(Map<String, dynamic> json) =
      _$_GetOffersModel.fromJson;

  @override
  List<Offer> get offers;
  @override
  @JsonKey(ignore: true)
  _$GetOffersModelCopyWith<_GetOffersModel> get copyWith =>
      throw _privateConstructorUsedError;
}
