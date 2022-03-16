import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/splash/domain/repositories/splash_repository.dart';

class SplashUsecase {
  final SplashRepository _repository;

  const SplashUsecase(this._repository);

  Future<Either<Failure, bool>> checkLogin() async {
    return await _repository.checkLoggin();
  }
}
