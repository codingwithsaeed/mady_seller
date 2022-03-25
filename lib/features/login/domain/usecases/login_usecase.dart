import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/login/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, Seller>> doLogin(Params params) async {
    return await repository.doLogin(params);
  }

  Future<void> saveSellerId(String sellerId) async {
    await repository.saveSellerId(sellerId);
  }
}
