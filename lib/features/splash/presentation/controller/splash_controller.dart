import 'dart:async';
import 'package:get/get.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/features/splash/domain/usecases/splash_usecase.dart';

class SplashController extends GetxController with StateMixin<bool> {
  final SplashUsecase _usecase;

  SplashController(this._usecase);

  @override
  void onInit() {
    checkLoginState();
    super.onInit();
  }

  Future<void> checkLoginState() async {
    change(false, status: RxStatus.loading());
    await Future.delayed(const Duration(seconds: 1));
    final result = await _usecase.checkLogin();

    result.fold((error) {
      if(error is ServerFailure) {
        change(false, status: RxStatus.error(error.message));
      }
    }, (loggedIn) {
      change(loggedIn, status: RxStatus.success());
    });

  }
}