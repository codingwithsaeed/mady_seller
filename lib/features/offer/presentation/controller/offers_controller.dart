import 'dart:developer';

import 'package:get/get.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_offers_usecase.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_seller_usecase.dart';

class OffersController extends GetxController with StateMixin<List<Offer>> {
  final GetSellerUsecase getSellerUsecase;
  final GetOffersUsecase getOffersUsecase;

  var lastOffers = <Offer>[];
  var filterType = FilterType.all;

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
      lastOffers = offers;
      filterOffers();
    });
  }

  void filterOffers() {
    log(filterType.name);
    switch (filterType) {
      case FilterType.all:
        lastOffers.isEmpty
            ? change(lastOffers, status: RxStatus.empty())
            : change(lastOffers, status: RxStatus.success());
        break;
      case FilterType.active:
        updateState(lastOffers, '1');
        break;
      case FilterType.preview:
        updateState(lastOffers, '0');
        break;
      case FilterType.deactive:
        updateState(lastOffers, '2');
        break;
    }
  }

  void updateState(List<Offer> list, String matcher) {
    List<Offer> filtedList = [];
    for (var element in lastOffers) {
      if (element.status == matcher) filtedList.add(element);
    }
    filtedList.isEmpty
        ? change(filtedList, status: RxStatus.empty())
        : change(filtedList, status: RxStatus.success());
  }
}

enum FilterType { all, active, preview, deactive }
