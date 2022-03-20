import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/features/splash/data/datasources/splash_datasource.dart';
import 'package:mady_seller/features/splash/domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashDatasource _datasource;
  final NetworkInfo _networkInfo;

  SplashRepositoryImpl(this._datasource, this._networkInfo);

  @override
  Future<Either<Failure, bool>> checkLoggin() async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(ServerFailure(Failure.noInternetConnection));
      }
      return Right(await _datasource.isLoggedIn());
    } on CacheException {
      return const Right(false);
    }
  }
}