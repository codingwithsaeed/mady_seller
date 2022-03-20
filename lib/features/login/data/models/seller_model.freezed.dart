// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'seller_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerModel _$SellerModelFromJson(Map<String, dynamic> json) {
  return _SellerModel.fromJson(json);
}

/// @nodoc
class _$SellerModelTearOff {
  const _$SellerModelTearOff();

  _SellerModel call({required int success, Seller? data}) {
    return _SellerModel(
      success: success,
      data: data,
    );
  }

  SellerModel fromJson(Map<String, Object?> json) {
    return SellerModel.fromJson(json);
  }
}

/// @nodoc
const $SellerModel = _$SellerModelTearOff();

/// @nodoc
mixin _$SellerModel {
  int get success => throw _privateConstructorUsedError;
  Seller? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerModelCopyWith<SellerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerModelCopyWith<$Res> {
  factory $SellerModelCopyWith(
          SellerModel value, $Res Function(SellerModel) then) =
      _$SellerModelCopyWithImpl<$Res>;
  $Res call({int success, Seller? data});

  $SellerCopyWith<$Res>? get data;
}

/// @nodoc
class _$SellerModelCopyWithImpl<$Res> implements $SellerModelCopyWith<$Res> {
  _$SellerModelCopyWithImpl(this._value, this._then);

  final SellerModel _value;
  // ignore: unused_field
  final $Res Function(SellerModel) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Seller?,
    ));
  }

  @override
  $SellerCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SellerCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$SellerModelCopyWith<$Res>
    implements $SellerModelCopyWith<$Res> {
  factory _$SellerModelCopyWith(
          _SellerModel value, $Res Function(_SellerModel) then) =
      __$SellerModelCopyWithImpl<$Res>;
  @override
  $Res call({int success, Seller? data});

  @override
  $SellerCopyWith<$Res>? get data;
}

/// @nodoc
class __$SellerModelCopyWithImpl<$Res> extends _$SellerModelCopyWithImpl<$Res>
    implements _$SellerModelCopyWith<$Res> {
  __$SellerModelCopyWithImpl(
      _SellerModel _value, $Res Function(_SellerModel) _then)
      : super(_value, (v) => _then(v as _SellerModel));

  @override
  _SellerModel get _value => super._value as _SellerModel;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_SellerModel(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Seller?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SellerModel implements _SellerModel {
  const _$_SellerModel({required this.success, this.data});

  factory _$_SellerModel.fromJson(Map<String, dynamic> json) =>
      _$$_SellerModelFromJson(json);

  @override
  final int success;
  @override
  final Seller? data;

  @override
  String toString() {
    return 'SellerModel(success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SellerModel &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$SellerModelCopyWith<_SellerModel> get copyWith =>
      __$SellerModelCopyWithImpl<_SellerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SellerModelToJson(this);
  }
}

abstract class _SellerModel implements SellerModel {
  const factory _SellerModel({required int success, Seller? data}) =
      _$_SellerModel;

  factory _SellerModel.fromJson(Map<String, dynamic> json) =
      _$_SellerModel.fromJson;

  @override
  int get success;
  @override
  Seller? get data;
  @override
  @JsonKey(ignore: true)
  _$SellerModelCopyWith<_SellerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
