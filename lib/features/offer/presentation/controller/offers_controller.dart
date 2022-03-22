// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:get/get.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_seller_usecase.dart';

class OffersController extends GetxController with StateMixin {
  final GetSellerUsecase _getSeller;

  OffersController(this._getSeller);

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    getSellerId();
  }

  Future<void> getSellerId() async {
    final result = _getSeller();
    result.fold((error) {
      if (error is GeneralFailure)
        change(null, status: RxStatus.error(error.message));
    }, (id) => getOffers(id));
  }

  Future<void> getOffers(String id) async {
    log(id);
  }
}
