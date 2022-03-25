import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:mady_seller/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource _datasource;
  final NetworkInfo _networkInfo;

  ProfileRepositoryImpl(this._datasource, this._networkInfo);

  @override
  Future<Either<Failure, Seller>> getSeller(Params params) async {
    try {
      if (!await _networkInfo.isConnected)
        return const Left(GeneralFailure(Failure.noInternetConnection));
      final result = await _datasource.getSeller(params.param);
      return Right(result);
    } on ServerException {
      return const Left(GeneralFailure(Failure.noInternetConnection));
    }
  }
}
