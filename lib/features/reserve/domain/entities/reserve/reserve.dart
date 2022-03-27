import 'package:freezed_annotation/freezed_annotation.dart';

part 'reserve.freezed.dart';
part 'reserve.g.dart';

@freezed
class Reserve with _$Reserve {
  const factory Reserve(
    String rid,
    String oid,
    String name,
    String count,
    String receipt,
    String status,
  ) = _Reserve;

  factory Reserve.fromJson(Map<String, dynamic> json) =>
      _$ReserveFromJson(json);
}
