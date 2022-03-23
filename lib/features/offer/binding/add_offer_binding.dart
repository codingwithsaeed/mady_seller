import 'package:get/get.dart';
import 'package:mady_seller/core/nework/api_provider.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/features/offer/data/datasources/add_offer_remote_datasource.dart';
import 'package:mady_seller/features/offer/data/repositories/add_offer_repository_impl.dart';
import 'package:mady_seller/features/offer/domain/usecases/add_offer_usecase.dart';
import 'package:mady_seller/features/offer/presentation/controller/add_offer_controller.dart';

class AddOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProviderImpl());
    Get.lazyPut(() => AddOfferRemoteDataSourceImpl(
          Get.find<ApiProviderImpl>(),
        ));
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(() => AddOfferRepositoryImpl(
          Get.find<AddOfferRemoteDataSourceImpl>(),
          Get.find<NetworkInfoImpl>(),
        ));
    Get.lazyPut(() => AddOfferUsecase(Get.find<AddOfferRepositoryImpl>()));
    Get.lazyPut(() => AddOfferController(Get.find<AddOfferUsecase>()));
  }
}
