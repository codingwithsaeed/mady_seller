import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/features/offer/data/datasources/get_seller_local_datasource.dart';
import 'package:mady_seller/features/offer/data/repositories/get_seller_repository_impl.dart';
import 'package:mady_seller/features/offer/domain/usecases/get_seller_usecase.dart';
import 'package:mady_seller/features/offer/presentation/controller/offers_controller.dart';

class OffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetStorage());
    Get.lazyPut(() => GetSellerLocalDatasourceImpl(Get.find<GetStorage>()));
    Get.lazyPut(() =>
        GetSellerRepositoryImpl(Get.find<GetSellerLocalDatasourceImpl>()));
    Get.lazyPut(() => GetSellerUsecase(Get.find<GetSellerRepositoryImpl>()));
    Get.lazyPut(() => OffersController(Get.find<GetSellerUsecase>()));
  }
}