// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reserve.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reserve _$ReserveFromJson(Map<String, dynamic> json) {
  return _Reserve.fromJson(json);
}

/// @nodoc
class _$ReserveTearOff {
  const _$ReserveTearOff();

  _Reserve call(String rid, String oid, String name, String count,
      String receipt, String status) {
    return _Reserve(
      rid,
      oid,
      name,
      count,
      receipt,
      status,
    );
  }

  Reserve fromJson(Map<String, Object?> json) {
    return Reserve.fromJson(json);
  }
}

/// @nodoc
const $Reserve = _$ReserveTearOff();

/// @nodoc
mixin _$Reserve {
  String get rid => throw _privateConstructorUsedError;
  String get oid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get count => throw _privateConstructorUsedError;
  String get receipt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReserveCopyWith<Reserve> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReserveCopyWith<$Res> {
  factory $ReserveCopyWith(Reserve value, $Res Function(Reserve) then) =
      _$ReserveCopyWithImpl<$Res>;
  $Res call(
      {String rid,
      String oid,
      String name,
      String count,
      String receipt,
      String status});
}

/// @nodoc
class _$ReserveCopyWithImpl<$Res> implements $ReserveCopyWith<$Res> {
  _$ReserveCopyWithImpl(this._value, this._then);

  final Reserve _value;
  // ignore: unused_field
  final $Res Function(Reserve) _then;

  @override
  $Res call({
    Object? rid = freezed,
    Object? oid = freezed,
    Object? name = freezed,
    Object? count = freezed,
    Object? receipt = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      rid: rid == freezed
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String,
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: receipt == freezed
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReserveCopyWith<$Res> implements $ReserveCopyWith<$Res> {
  factory _$ReserveCopyWith(_Reserve value, $Res Function(_Reserve) then) =
      __$ReserveCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rid,
      String oid,
      String name,
      String count,
      String receipt,
      String status});
}

/// @nodoc
class __$ReserveCopyWithImpl<$Res> extends _$ReserveCopyWithImpl<$Res>
    implements _$ReserveCopyWith<$Res> {
  __$ReserveCopyWithImpl(_Reserve _value, $Res Function(_Reserve) _then)
      : super(_value, (v) => _then(v as _Reserve));

  @override
  _Reserve get _value => super._value as _Reserve;

  @override
  $Res call({
    Object? rid = freezed,
    Object? oid = freezed,
    Object? name = freezed,
    Object? count = freezed,
    Object? receipt = freezed,
    Object? status = freezed,
  }) {
    return _then(_Reserve(
      rid == freezed
          ? _value.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String,
      oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      receipt == freezed
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reserve implements _Reserve {
  const _$_Reserve(
      this.rid, this.oid, this.name, this.count, this.receipt, this.status);

  factory _$_Reserve.fromJson(Map<String, dynamic> json) =>
      _$$_ReserveFromJson(json);

  @override
  final String rid;
  @override
  final String oid;
  @override
  final String name;
  @override
  final String count;
  @override
  final String receipt;
  @override
  final String status;

  @override
  String toString() {
    return 'Reserve(rid: $rid, oid: $oid, name: $name, count: $count, receipt: $receipt, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reserve &&
            const DeepCollectionEquality().equals(other.rid, rid) &&
            const DeepCollectionEquality().equals(other.oid, oid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.receipt, receipt) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rid),
      const DeepCollectionEquality().hash(oid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(receipt),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$ReserveCopyWith<_Reserve> get copyWith =>
      __$ReserveCopyWithImpl<_Reserve>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReserveToJson(this);
  }
}

abstract class _Reserve implements Reserve {
  const factory _Reserve(String rid, String oid, String name, String count,
      String receipt, String status) = _$_Reserve;

  factory _Reserve.fromJson(Map<String, dynamic> json) = _$_Reserve.fromJson;

  @override
  String get rid;
  @override
  String get oid;
  @override
  String get name;
  @override
  String get count;
  @override
  String get receipt;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$ReserveCopyWith<_Reserve> get copyWith =>
      throw _privateConstructorUsedError;
}
