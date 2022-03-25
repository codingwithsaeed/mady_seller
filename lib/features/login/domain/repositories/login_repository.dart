import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';

abstract class LoginRepository {
  Future<Either<Failure, Seller>> doLogin(Params params);
  Future<void> saveSellerId(String sellerId);
}
