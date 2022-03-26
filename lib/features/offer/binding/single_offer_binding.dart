import 'package:get/get.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/features/offer/data/datasources/single_offer_remote_datasource.dart';
import 'package:mady_seller/features/offer/data/repositories/single_offer_repository_impl.dart';
import 'package:mady_seller/features/offer/domain/usecases/single_offer_usecase.dart';
import 'package:mady_seller/features/offer/presentation/controllers/single_offer_controller.dart';

class SingleOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProviderImpl());
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(
        () => SingleOfferRemoteDatasourceImpl(Get.find<ApiProviderImpl>()));
    Get.lazyPut(() => SingleOfferRepositoryImpl(
        Get.find<SingleOfferRemoteDatasourceImpl>(),
        Get.find<NetworkInfoImpl>()));
    Get.lazyPut(
        () => SingleOfferUsecase(Get.find<SingleOfferRepositoryImpl>()));
    Get.lazyPut(() => SingleOfferController(Get.find<SingleOfferUsecase>()));
  }
}
