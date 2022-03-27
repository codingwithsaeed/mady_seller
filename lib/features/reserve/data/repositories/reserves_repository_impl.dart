import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/reserve/data/datasources/reserves_remote_datasource.dart';
import 'package:mady_seller/features/reserve/domain/entities/reserve/reserve.dart';
import 'package:mady_seller/features/reserve/domain/repositories/reserves_repository.dart';

class ReservesRepositoryImpl implements ReservesRepository {
  final ReservesRemoteDatasource _datasource;
  final NetworkInfo _networkInfo;

  ReservesRepositoryImpl(this._datasource, this._networkInfo);

  @override
  Future<Either<Failure, List<Reserve>>> getReserves(Params params) async {
    try {
      if (!await _networkInfo.isConnected)
        return const Left(GeneralFailure(Failure.noInternetConnection));
      final result = await _datasource.getReserves(params.param);
      return Right(result.data);
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }
}
