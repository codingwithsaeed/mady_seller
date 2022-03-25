import 'package:get/get.dart';
import 'package:mady_seller/core/network/api_provider.dart';
import 'package:mady_seller/core/network/network_info.dart';
import 'package:mady_seller/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:mady_seller/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:mady_seller/features/profile/domain/usecases/profile_usecase.dart';
import 'package:mady_seller/features/profile/presentation/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProviderImpl());
    Get.lazyPut(() => const NetworkInfoImpl());
    Get.lazyPut(() => ProfileRemoteDatasourceImpl(Get.find<ApiProviderImpl>()));
    Get.lazyPut(() => ProfileRepositoryImpl(
        Get.find<ProfileRemoteDatasourceImpl>(), Get.find<NetworkInfoImpl>()));
    Get.lazyPut(() => ProfileUsecase(Get.find<ProfileRepositoryImpl>()));
    Get.lazyPut(() => ProfileController(Get.find<ProfileUsecase>()));
  }
}
