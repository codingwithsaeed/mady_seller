import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/features/offer/data/datasources/get_offers_remote_datasource.dart';
import 'package:mady_seller/features/offer/data/datasources/get_seller_local_datasource.dart';
import 'package:mady_seller/features/offer/data/repositories/get_offers_repository_impl.dart';
import 'package:mady_seller/features/offer/data/repositories/get_seller_repository_impl.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_offers_usecase.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_seller_usecase.dart';
import 'package:mady_seller/features/offer/presentation/controllers/offers_controller.dart';

class OffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetStorage());
    Get.lazyPut(() => GetSellerLocalDatasourceImpl(Get.find<GetStorage>()));
    Get.lazyPut(() => GetSellerRepositoryImpl(
          Get.find<GetSellerLocalDatasourceImpl>(),
        ));
    Get.lazyPut(() => GetSellerUsecase(Get.find<GetSellerRepositoryImpl>()));
    Get.lazyPut(() => ApiProviderImpl());
    Get.lazyPut(() => GetOffersRemoteDatasourceImpl(
          Get.find<ApiProviderImpl>(),
        ));
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(() => GetOffersRepositoryImpl(
          Get.find<GetOffersRemoteDatasourceImpl>(),
          Get.find<NetworkInfoImpl>(),
        ));
    Get.lazyPut(() => GetOffersUsecase(Get.find<GetOffersRepositoryImpl>()));
    Get.lazyPut(() => OffersController(
          getSellerUsecase: Get.find<GetSellerUsecase>(),
          getOffersUsecase: Get.find<GetOffersUsecase>(),
        ));
  }
}
