import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/reserve/domain/entities/reserve/reserve.dart';

abstract class ReservesRepository {
  Future<Either<Failure, List<Reserve>>> getReserves(Params params);
  Future<Either<Failure, bool>> determineReserveStatus(Params params);
}
