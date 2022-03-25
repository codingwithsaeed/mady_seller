import 'package:get/get.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';

class SingleOfferController extends GetxController with StateMixin<Offer> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  void loadOffer(Offer offer) => change(offer, status: RxStatus.success());
}

extension BetterOffer on Offer {
  bool get canUpdate => status == '0';
}
