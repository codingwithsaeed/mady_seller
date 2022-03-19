import 'package:get/get.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/features/splash/data/datasources/splash_datasource.dart';
import 'package:mady_seller/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:mady_seller/features/splash/domain/usecases/splash_usecase.dart';
import 'package:mady_seller/features/splash/presentation/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const SplashDatasourceImpl());
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(
      () => SplashRepositoryImpl(
        Get.find<SplashDatasourceImpl>(),
        Get.find<NetworkInfoImpl>(),
      ),
    );
    Get.lazyPut(() => SplashUsecase(Get.find<SplashRepositoryImpl>()));
    Get.lazyPut(() => SplashController(Get.find<SplashUsecase>()));
  }
}
