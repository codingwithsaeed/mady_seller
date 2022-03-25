import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/offer/data/datasources/add_offer_remote_datasource.dart';
import 'package:mady_seller/features/offer/domain/repositories/add_offer_repository.dart';

class AddOfferRepositoryImpl implements AddOfferRepository {
  final AddOfferRemoteDataSource _dataSource;
  final NetworkInfo _networkInfo;

  AddOfferRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, bool>> addOffer(Params params) async {
    try {
      if (!await _networkInfo.isConnected)
        return const Left(GeneralFailure(Failure.noInternetConnection));
      final result = await _dataSource.addOffer(params.param);
      switch (result.success) {
        case 0:
          return const Left(GeneralFailure('مشکل در عملیات ثبت'));
        case -2:
          return Left(GeneralFailure(result.error!));
        default:
          return const Right(true);
      }
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> uploadPicture(Params params) async {
    if (!await _networkInfo.isConnected)
      return const Left(GeneralFailure(Failure.noInternetConnection));

    try {
      final result = await _dataSource.uploadPicture(params.param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }
}
