import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/offer/data/datasources/single_offer_remote_datasource.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/domain/repositories/single_offer_repository.dart';

class SingleOfferRepositoryImpl implements SingleOfferRepository {
  final SingleOfferRemoteDatasource _datasource;
  final NetworkInfo _networkInfo;

  SingleOfferRepositoryImpl(this._datasource, this._networkInfo);

  @override
  Future<Either<Failure, bool>> updateOffer(Params params) async {
    if (!await _networkInfo.isConnected)
      return const Left(GeneralFailure(Failure.noInternetConnection));
    try {
      final result = await _datasource.updateOffer(params.param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Offer>> getOffer(Params params) async {
    if (!await _networkInfo.isConnected)
      return const Left(GeneralFailure(Failure.noInternetConnection));
    try {
      final result = await _datasource.getOffer(params.param);
      if (result.success == 1) return Right(result.offer!);
      return const Left(GeneralFailure('خطا در دریافت آفر'));
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> uploadPicture(Params params) async {
    if (!await _networkInfo.isConnected)
      return const Left(GeneralFailure(Failure.noInternetConnection));

    try {
      final result = await _datasource.uploadPicture(params.param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> determineOfferStatus(Params params) async {
    if (!await _networkInfo.isConnected)
      return const Left(GeneralFailure(Failure.noInternetConnection));

    try {
      final result = await _datasource.determineOffer(params.param);
      if (result.success == 1)
        return const Right(true);
      else if (result.success == 0)
        return const Left(GeneralFailure('خطایی رخ داد!'));
      else
        return Left(GeneralFailure(result.error!));
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }
}
