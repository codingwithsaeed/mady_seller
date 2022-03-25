import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';

abstract class AddOfferRepository {
  Future<Either<Failure, String>> uploadPicture(Params params);
  Future<Either<Failure, bool>> addOffer(Params params);
}
