import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/profile/domain/usecases/profile_usecase.dart';

class ProfileController extends GetxController with StateMixin<Seller> {
  final ProfileUsecase _usecase;

  ProfileController(this._usecase);

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    getSeller();
    super.onInit();
  }

  Future<void> getSeller() async {
    change(null, status: RxStatus.loading());
    String sid = GetStorage().read('id');
    final result =
        await _usecase.getSeller(Params({'action': 'get_seller', 'sid': sid}));

    result.fold((e) {
      change(null, status: RxStatus.error((e as GeneralFailure).message));
    }, (seller) {
      change(seller, status: RxStatus.success());
    });
  }
}
