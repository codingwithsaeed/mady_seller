import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/splash/domain/usecases/splash_usecase.dart';

class SplashController extends GetxController {
  final SplashUsecase _usecase;

  var isLoaded = false;
  var errorText = '';

  SplashController(this._usecase);

  @override
  @mustCallSuper
  void onInit() {
    callCheckByDelay(1);
    super.onInit();
  }

  void callCheckByDelay(int seconds) {
    isLoaded = false;
    errorText = "";
    update();
    Timer(Duration(seconds: seconds), () => checkLoggedIn());
  }

  Future<void> checkLoggedIn() async {
    final result = await _usecase.checkLogin();
    result.fold((error) {
      isLoaded = true;
      errorText = (error as ServerFailure).message;
      //Snackbar Here ???
      update();
    }, (val) {
      isLoaded = false;
      errorText = "";
      update();
      if (!val) {
        Get.offNamed(AppRoutes.login);
      } else {
        print('going to main');
      }
    });
  }
}
