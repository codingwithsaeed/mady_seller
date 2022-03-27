// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'deter_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeterOfferModel _$DeterOfferModelFromJson(Map<String, dynamic> json) {
  return _DeterOfferModel.fromJson(json);
}

/// @nodoc
class _$DeterOfferModelTearOff {
  const _$DeterOfferModelTearOff();

  _DeterOfferModel call(int success, String? error) {
    return _DeterOfferModel(
      success,
      error,
    );
  }

  DeterOfferModel fromJson(Map<String, Object?> json) {
    return DeterOfferModel.fromJson(json);
  }
}

/// @nodoc
const $DeterOfferModel = _$DeterOfferModelTearOff();

/// @nodoc
mixin _$DeterOfferModel {
  int get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeterOfferModelCopyWith<DeterOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeterOfferModelCopyWith<$Res> {
  factory $DeterOfferModelCopyWith(
          DeterOfferModel value, $Res Function(DeterOfferModel) then) =
      _$DeterOfferModelCopyWithImpl<$Res>;
  $Res call({int success, String? error});
}

/// @nodoc
class _$DeterOfferModelCopyWithImpl<$Res>
    implements $DeterOfferModelCopyWith<$Res> {
  _$DeterOfferModelCopyWithImpl(this._value, this._then);

  final DeterOfferModel _value;
  // ignore: unused_field
  final $Res Function(DeterOfferModel) _then;

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
abstract class _$DeterOfferModelCopyWith<$Res>
    implements $DeterOfferModelCopyWith<$Res> {
  factory _$DeterOfferModelCopyWith(
          _DeterOfferModel value, $Res Function(_DeterOfferModel) then) =
      __$DeterOfferModelCopyWithImpl<$Res>;
  @override
  $Res call({int success, String? error});
}

/// @nodoc
class __$DeterOfferModelCopyWithImpl<$Res>
    extends _$DeterOfferModelCopyWithImpl<$Res>
    implements _$DeterOfferModelCopyWith<$Res> {
  __$DeterOfferModelCopyWithImpl(
      _DeterOfferModel _value, $Res Function(_DeterOfferModel) _then)
      : super(_value, (v) => _then(v as _DeterOfferModel));

  @override
  _DeterOfferModel get _value => super._value as _DeterOfferModel;

  @override
  $Res call({
    Object? success = freezed,
    Object? error = freezed,
  }) {
    return _then(_DeterOfferModel(
      success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeterOfferModel implements _DeterOfferModel {
  const _$_DeterOfferModel(this.success, this.error);

  factory _$_DeterOfferModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeterOfferModelFromJson(json);

  @override
  final int success;
  @override
  final String? error;

  @override
  String toString() {
    return 'DeterOfferModel(success: $success, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeterOfferModel &&
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
  _$DeterOfferModelCopyWith<_DeterOfferModel> get copyWith =>
      __$DeterOfferModelCopyWithImpl<_DeterOfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeterOfferModelToJson(this);
  }
}

abstract class _DeterOfferModel implements DeterOfferModel {
  const factory _DeterOfferModel(int success, String? error) =
      _$_DeterOfferModel;

  factory _DeterOfferModel.fromJson(Map<String, dynamic> json) =
      _$_DeterOfferModel.fromJson;

  @override
  int get success;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$DeterOfferModelCopyWith<_DeterOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}
