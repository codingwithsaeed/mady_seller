import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/domain/repositories/get_offers_repository.dart';

class GetOffersUsecase {
  final GetOffersRepository _repository;

  GetOffersUsecase(this._repository);

  Future<Either<Failure, List<Offer>>> call(Params params) async =>
      await _repository.getOffers(params);
}
