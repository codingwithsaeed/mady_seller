import 'package:get/get.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/features/reserve/data/datasources/reserves_remote_datasource.dart';
import 'package:mady_seller/features/reserve/data/repositories/reserves_repository_impl.dart';
import 'package:mady_seller/features/reserve/domain/usecases/reserves_usecase.dart';
import 'package:mady_seller/features/reserve/presentation/controllers/reserves_controller.dart';

class ReserveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProviderImpl());
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(
        () => ReservesRemoteDatasourceImpl(Get.find<ApiProviderImpl>()));
    Get.lazyPut(() => ReservesRepositoryImpl(
        Get.find<ReservesRemoteDatasourceImpl>(), Get.find<NetworkInfoImpl>()));
    Get.lazyPut(() => ReservesUsecase(Get.find<ReservesRepositoryImpl>()));
    Get.lazyPut(() => ReservesController(Get.find<ReservesUsecase>()));
  }
}
