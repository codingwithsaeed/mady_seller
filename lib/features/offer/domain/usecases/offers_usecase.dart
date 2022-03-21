import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/offer/domain/repositories/offers_repository.dart';

class OffersUsecase {
  final OffersRepository repository;

  OffersUsecase(this.repository);

  Either<Failure, String> getSellerId() {
    return repository.getSellerId();
  }
}
