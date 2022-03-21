import 'package:mady_seller/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mady_seller/features/offer/data/datasources/get_seller_local_datasource.dart';
import 'package:mady_seller/features/offer/domain/repositories/get_seller_repository.dart';

class GetSellerRepositoryImpl implements GetSellerRepository {
  final GetSellerLocalDatasource _datasource;

  GetSellerRepositoryImpl(this._datasource);

  @override
  Either<Failure, String> getSellerId() {
    try {
      final result = _datasource.getSellerId();
      if (result == null) return const Left(GeneralFailure(Failure.notFound));
      return Right(result);
    } on Exception {
      return const Left(GeneralFailure(Failure.notFound));
    }
  }
}
