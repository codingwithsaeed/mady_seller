import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool>> checkLoggin();
}