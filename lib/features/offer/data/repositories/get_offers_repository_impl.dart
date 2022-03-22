// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:mady_seller/core/errors/exceptions.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/features/offer/data/datasources/get_offers_remote_datasource.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mady_seller/features/offer/domain/repositories/get_offers_repository.dart';

class GetOffersRepositoryImpl implements GetOffersRepository {
  final GetOffersRemoteDatasource _datasource;
  final NetworkInfo _networkInfo;

  GetOffersRepositoryImpl(this._datasource, this._networkInfo);

  @override
  Future<Either<Failure, List<Offer>>> getOffers(Params params) async {
    try {
      if (!await _networkInfo.isConnected)
        return const Left(GeneralFailure(Failure.noInternetConnection));
      final result = await _datasource.getOffers(params.param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(GeneralFailure(e.message));
    }
  }
}
