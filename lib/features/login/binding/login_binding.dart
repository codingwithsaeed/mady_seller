import 'package:get/get.dart';
import 'package:mady_seller/core/nework/api_provider.dart';
import 'package:mady_seller/core/nework/network_info.dart';
import 'package:mady_seller/features/login/data/datasources/login_datasource.dart';
import 'package:mady_seller/features/login/data/repositories/login_repository_impl.dart';
import 'package:mady_seller/features/login/domain/usecases/login_usecase.dart';
import 'package:mady_seller/features/login/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProviderImpl());
    Get.lazyPut(() => LoginDatasourceImpl(Get.find<ApiProviderImpl>()));
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(
      () => LoginRepositoryImpl(
        Get.find<LoginDatasourceImpl>(),
        Get.find<NetworkInfoImpl>(),
      ),
    );
    Get.lazyPut(() => LoginUsecase(Get.find<LoginRepositoryImpl>()));
    Get.lazyPut(() => LoginController(Get.find<LoginUsecase>()));
  }
}
