import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/offer/domain/repositories/get_seller_repository.dart';

class GetSellerUsecase {
  final GetSellerRepository repository;

  GetSellerUsecase(this.repository);

  Either<Failure, String> call() => repository.getSellerId();
}
