import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/reserve/domain/entities/reserve/reserve.dart';
import 'package:mady_seller/features/reserve/domain/repositories/reserves_repository.dart';

class ReservesUsecase {
  final ReservesRepository _repository;

  ReservesUsecase(this._repository);

  Future<Either<Failure, List<Reserve>>> getReserves(Params params) async =>
      await _repository.getReserves(params);

  Future<Either<Failure, bool>> determineReserveStatus(Params params) async =>
      await _repository.determineReserveStatus(params);
}
