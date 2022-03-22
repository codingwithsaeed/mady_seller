import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';

abstract class GetOffersRepository {
  Future<Either<Failure, List<Offer>>> getOffers(Params params);
}
