import 'package:get/state_manager.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/nework/params.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/login/domain/usecases/login_usecase.dart';

class LoginController extends GetxController with StateMixin<Seller> {
  final LoginUsecase _usecase;
  var phone = ''.obs;
  var password = ''.obs;

  LoginController(this._usecase);

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<void> doLogin() async {
    change(null, status: RxStatus.loading());
    await Future.delayed(const Duration(seconds: 1));
    final result = await _usecase.doLogin(
      Params({
        'action': 'signin',
        'phone': phone.value,
        'password': password.value
      }),
    );
    result.fold((error) {
      if (error is ServerFailure) {
        change(null, status: RxStatus.error(error.message));
      }
    }, (seller) {
      change(seller, status: RxStatus.success());
    });
  }
}
