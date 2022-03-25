import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/profile/domain/repositories/profile_repository.dart';

class ProfileUsecase {
  final ProfileRepository _repository;

  ProfileUsecase(this._repository);

  Future<Either<Failure, Seller>> getSeller(Params params) async {
    return await _repository.getSeller(params);
  }
}
