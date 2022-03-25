// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_seller_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetSellerModel _$GetSellerModelFromJson(Map<String, dynamic> json) {
  return _GetSellerModel.fromJson(json);
}

/// @nodoc
class _$GetSellerModelTearOff {
  const _$GetSellerModelTearOff();

  _GetSellerModel call({required int success, Seller? data}) {
    return _GetSellerModel(
      success: success,
      data: data,
    );
  }

  GetSellerModel fromJson(Map<String, Object?> json) {
    return GetSellerModel.fromJson(json);
  }
}

/// @nodoc
const $GetSellerModel = _$GetSellerModelTearOff();

/// @nodoc
mixin _$GetSellerModel {
  int get success => throw _privateConstructorUsedError;
  Seller? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSellerModelCopyWith<GetSellerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSellerModelCopyWith<$Res> {
  factory $GetSellerModelCopyWith(
          GetSellerModel value, $Res Function(GetSellerModel) then) =
      _$GetSellerModelCopyWithImpl<$Res>;
  $Res call({int success, Seller? data});

  $SellerCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetSellerModelCopyWithImpl<$Res>
    implements $GetSellerModelCopyWith<$Res> {
  _$GetSellerModelCopyWithImpl(this._value, this._then);

  final GetSellerModel _value;
  // ignore: unused_field
  final $Res Function(GetSellerModel) _then;

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
abstract class _$GetSellerModelCopyWith<$Res>
    implements $GetSellerModelCopyWith<$Res> {
  factory _$GetSellerModelCopyWith(
          _GetSellerModel value, $Res Function(_GetSellerModel) then) =
      __$GetSellerModelCopyWithImpl<$Res>;
  @override
  $Res call({int success, Seller? data});

  @override
  $SellerCopyWith<$Res>? get data;
}

/// @nodoc
class __$GetSellerModelCopyWithImpl<$Res>
    extends _$GetSellerModelCopyWithImpl<$Res>
    implements _$GetSellerModelCopyWith<$Res> {
  __$GetSellerModelCopyWithImpl(
      _GetSellerModel _value, $Res Function(_GetSellerModel) _then)
      : super(_value, (v) => _then(v as _GetSellerModel));

  @override
  _GetSellerModel get _value => super._value as _GetSellerModel;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_GetSellerModel(
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
class _$_GetSellerModel implements _GetSellerModel {
  const _$_GetSellerModel({required this.success, this.data});

  factory _$_GetSellerModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetSellerModelFromJson(json);

  @override
  final int success;
  @override
  final Seller? data;

  @override
  String toString() {
    return 'GetSellerModel(success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetSellerModel &&
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
  _$GetSellerModelCopyWith<_GetSellerModel> get copyWith =>
      __$GetSellerModelCopyWithImpl<_GetSellerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetSellerModelToJson(this);
  }
}

abstract class _GetSellerModel implements GetSellerModel {
  const factory _GetSellerModel({required int success, Seller? data}) =
      _$_GetSellerModel;

  factory _GetSellerModel.fromJson(Map<String, dynamic> json) =
      _$_GetSellerModel.fromJson;

  @override
  int get success;
  @override
  Seller? get data;
  @override
  @JsonKey(ignore: true)
  _$GetSellerModelCopyWith<_GetSellerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
