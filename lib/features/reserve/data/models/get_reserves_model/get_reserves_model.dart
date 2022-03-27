import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mady_seller/features/reserve/domain/entities/reserve/reserve.dart';

part 'get_reserves_model.freezed.dart';
part 'get_reserves_model.g.dart';

@freezed
class GetReservesModel with _$GetReservesModel {
  const factory GetReservesModel(
    int success,
    List<Reserve> data,
  ) = _GetReservesModel;

  factory GetReservesModel.fromJson(Map<String, dynamic> json) =>
      _$GetReservesModelFromJson(json);
}
