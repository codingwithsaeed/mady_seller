// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddOfferModel _$AddOfferModelFromJson(Map<String, dynamic> json) {
  return _AddOfferModel.fromJson(json);
}

/// @nodoc
class _$AddOfferModelTearOff {
  const _$AddOfferModelTearOff();

  _AddOfferModel call({required int success, String? error}) {
    return _AddOfferModel(
      success: success,
      error: error,
    );
  }

  AddOfferModel fromJson(Map<String, Object?> json) {
    return AddOfferModel.fromJson(json);
  }
}

/// @nodoc
const $AddOfferModel = _$AddOfferModelTearOff();

/// @nodoc
mixin _$AddOfferModel {
  int get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddOfferModelCopyWith<AddOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOfferModelCopyWith<$Res> {
  factory $AddOfferModelCopyWith(
          AddOfferModel value, $Res Function(AddOfferModel) then) =
      _$AddOfferModelCopyWithImpl<$Res>;
  $Res call({int success, String? error});
}

/// @nodoc
class _$AddOfferModelCopyWithImpl<$Res>
    implements $AddOfferModelCopyWith<$Res> {
  _$AddOfferModelCopyWithImpl(this._value, this._then);

  final AddOfferModel _value;
  // ignore: unused_field
  final $Res Function(AddOfferModel) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddOfferModelCopyWith<$Res>
    implements $AddOfferModelCopyWith<$Res> {
  factory _$AddOfferModelCopyWith(
          _AddOfferModel value, $Res Function(_AddOfferModel) then) =
      __$AddOfferModelCopyWithImpl<$Res>;
  @override
  $Res call({int success, String? error});
}

/// @nodoc
class __$AddOfferModelCopyWithImpl<$Res>
    extends _$AddOfferModelCopyWithImpl<$Res>
    implements _$AddOfferModelCopyWith<$Res> {
  __$AddOfferModelCopyWithImpl(
      _AddOfferModel _value, $Res Function(_AddOfferModel) _then)
      : super(_value, (v) => _then(v as _AddOfferModel));

  @override
  _AddOfferModel get _value => super._value as _AddOfferModel;

  @override
  $Res call({
    Object? success = freezed,
    Object? error = freezed,
  }) {
    return _then(_AddOfferModel(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddOfferModel implements _AddOfferModel {
  const _$_AddOfferModel({required this.success, this.error});

  factory _$_AddOfferModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddOfferModelFromJson(json);

  @override
  final int success;
  @override
  final String? error;

  @override
  String toString() {
    return 'AddOfferModel(success: $success, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddOfferModel &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$AddOfferModelCopyWith<_AddOfferModel> get copyWith =>
      __$AddOfferModelCopyWithImpl<_AddOfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddOfferModelToJson(this);
  }
}

abstract class _AddOfferModel implements AddOfferModel {
  const factory _AddOfferModel({required int success, String? error}) =
      _$_AddOfferModel;

  factory _AddOfferModel.fromJson(Map<String, dynamic> json) =
      _$_AddOfferModel.fromJson;

  @override
  int get success;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$AddOfferModelCopyWith<_AddOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}
