import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';

abstract class OffersRepository {
  Either<Failure, String> getSellerId();
}
