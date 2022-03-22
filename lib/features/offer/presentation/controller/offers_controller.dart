// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:get/get.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_offers_usecase.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_seller_usecase.dart';

class OffersController extends GetxController with StateMixin<List<Offer>> {
  final GetSellerUsecase getSellerUsecase;
  final GetOffersUsecase getOffersUsecase;

  OffersController(
      {required this.getSellerUsecase, required this.getOffersUsecase});

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    getSellerId();
  }

  Future<void> getSellerId() async {
    final result = getSellerUsecase();
    result.fold((error) {
      if (error is GeneralFailure)
        change(null, status: RxStatus.error(error.message));
    }, (id) => getOffers(id));
  }

  Future<void> getOffers(String id) async {
    change(null, status: RxStatus.loading());
    final result = await getOffersUsecase(
      Params({'action': 'get_offers', 'sid': id}),
    );
    result.fold((error) {
      if (error is GeneralFailure)
        change([], status: RxStatus.error(error.message));
    }, (offers) {
      if (offers.isNotEmpty)
        change(offers, status: RxStatus.success());
      else
        change(offers, status: RxStatus.empty());
    });
  }
}
