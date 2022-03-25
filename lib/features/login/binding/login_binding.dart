import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/features/login/data/datasources/login_local_datasource.dart';
import 'package:mady_seller/features/login/data/datasources/login_remote_datasource.dart';
import 'package:mady_seller/features/login/data/repositories/login_repository_impl.dart';
import 'package:mady_seller/features/login/domain/usecases/login_usecase.dart';
import 'package:mady_seller/features/login/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProviderImpl());
    Get.lazyPut(() => LoginRemoteDatasourceImpl(Get.find<ApiProviderImpl>()));
    Get.lazyPut(() => GetStorage());
    Get.lazyPut(() => LoginLocalDatasourceImpl(Get.find<GetStorage>()));
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(
      () => LoginRepositoryImpl(
        Get.find<LoginRemoteDatasourceImpl>(),
        Get.find<LoginLocalDatasourceImpl>(),
        Get.find<NetworkInfoImpl>(),
      ),
    );
    Get.lazyPut(() => LoginUsecase(Get.find<LoginRepositoryImpl>()));
    Get.lazyPut(() => LoginController(Get.find<LoginUsecase>()));
  }
}
