import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Seller>> getSeller(Params params);
}
