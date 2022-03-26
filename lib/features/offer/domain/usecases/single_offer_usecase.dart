import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/domain/repositories/single_offer_repository.dart';

class SingleOfferUsecase {
  final SingleOfferRepository _repository;

  SingleOfferUsecase(this._repository);

  Future<Either<Failure, bool>> updateOffer(Params params) async {
    return await _repository.updateOffer(params);
  }

  Future<Either<Failure, Offer>> getOffer(Params params) async {
    return await _repository.getOffer(params);
  }
}
