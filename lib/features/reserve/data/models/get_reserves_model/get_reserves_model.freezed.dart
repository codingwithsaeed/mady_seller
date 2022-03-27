// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_reserves_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetReservesModel _$GetReservesModelFromJson(Map<String, dynamic> json) {
  return _GetReservesModel.fromJson(json);
}

/// @nodoc
class _$GetReservesModelTearOff {
  const _$GetReservesModelTearOff();

  _GetReservesModel call(int success, List<Reserve> data) {
    return _GetReservesModel(
      success,
      data,
    );
  }

  GetReservesModel fromJson(Map<String, Object?> json) {
    return GetReservesModel.fromJson(json);
  }
}

/// @nodoc
const $GetReservesModel = _$GetReservesModelTearOff();

/// @nodoc
mixin _$GetReservesModel {
  int get success => throw _privateConstructorUsedError;
  List<Reserve> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetReservesModelCopyWith<GetReservesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReservesModelCopyWith<$Res> {
  factory $GetReservesModelCopyWith(
          GetReservesModel value, $Res Function(GetReservesModel) then) =
      _$GetReservesModelCopyWithImpl<$Res>;
  $Res call({int success, List<Reserve> data});
}

/// @nodoc
class _$GetReservesModelCopyWithImpl<$Res>
    implements $GetReservesModelCopyWith<$Res> {
  _$GetReservesModelCopyWithImpl(this._value, this._then);

  final GetReservesModel _value;
  // ignore: unused_field
  final $Res Function(GetReservesModel) _then;

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
              as List<Reserve>,
    ));
  }
}

/// @nodoc
abstract class _$GetReservesModelCopyWith<$Res>
    implements $GetReservesModelCopyWith<$Res> {
  factory _$GetReservesModelCopyWith(
          _GetReservesModel value, $Res Function(_GetReservesModel) then) =
      __$GetReservesModelCopyWithImpl<$Res>;
  @override
  $Res call({int success, List<Reserve> data});
}

/// @nodoc
class __$GetReservesModelCopyWithImpl<$Res>
    extends _$GetReservesModelCopyWithImpl<$Res>
    implements _$GetReservesModelCopyWith<$Res> {
  __$GetReservesModelCopyWithImpl(
      _GetReservesModel _value, $Res Function(_GetReservesModel) _then)
      : super(_value, (v) => _then(v as _GetReservesModel));

  @override
  _GetReservesModel get _value => super._value as _GetReservesModel;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_GetReservesModel(
      success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Reserve>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetReservesModel implements _GetReservesModel {
  const _$_GetReservesModel(this.success, this.data);

  factory _$_GetReservesModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetReservesModelFromJson(json);

  @override
  final int success;
  @override
  final List<Reserve> data;

  @override
  String toString() {
    return 'GetReservesModel(success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetReservesModel &&
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
  _$GetReservesModelCopyWith<_GetReservesModel> get copyWith =>
      __$GetReservesModelCopyWithImpl<_GetReservesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetReservesModelToJson(this);
  }
}

abstract class _GetReservesModel implements GetReservesModel {
  const factory _GetReservesModel(int success, List<Reserve> data) =
      _$_GetReservesModel;

  factory _GetReservesModel.fromJson(Map<String, dynamic> json) =
      _$_GetReservesModel.fromJson;

  @override
  int get success;
  @override
  List<Reserve> get data;
  @override
  @JsonKey(ignore: true)
  _$GetReservesModelCopyWith<_GetReservesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
