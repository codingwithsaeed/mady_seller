import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';

abstract class SingleOfferRepository {
  Future<Either<Failure, bool>> updateOffer(Params params);
  Future<Either<Failure, Offer>> getOffer(Params params);
  Future<Either<Failure, String>> uploadPicture(Params params);
  Future<Either<Failure, bool>> determineOfferStatus(Params params);
}
