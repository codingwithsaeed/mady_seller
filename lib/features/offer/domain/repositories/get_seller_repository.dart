import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';

abstract class GetSellerRepository {
  Either<Failure, String> getSellerId();
}
