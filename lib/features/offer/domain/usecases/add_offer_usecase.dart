import 'package:dartz/dartz.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/offer/domain/repositories/add_offer_repository.dart';

class AddOfferUsecase {
  final AddOfferRepository _repository;

  AddOfferUsecase(this._repository);

  Future<Either<Failure, bool>> call(Params params) async =>
      await _repository.addOffer(params);

  Future<Either<Failure, String>> uploadPicture(Params params) async =>
      await _repository.uploadPicture(params);    
}
