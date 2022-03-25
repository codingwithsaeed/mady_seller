import 'package:get/get.dart';
import 'package:mady_seller/features/offer/presentation/controllers/single_offer_controller.dart';

class SingleOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SingleOfferController());
  }
}