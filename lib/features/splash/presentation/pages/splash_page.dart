import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/splash/presentation/controller/splash_controller.dart';

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.status.isSuccess) {
        controller.state!
            ? Get.offNamed(AppRoutes.offers)
            : Get.offNamed(AppRoutes.login);
      }
      if (controller.status.isError) {
        Get.snackbar(
          'خطا',
          controller.status.errorMessage!,
          backgroundColor: Colors.red.shade700,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.amber.shade700,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Image(
                image: AssetImage('assets/images/sale-white.png'),
              ),
            ),
            controller.obx(
              (value) => const SizedBox(
                height: 10,
              ),
              onError: (error) => buildErrorBody(),
              onLoading: buildLoading(),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget buildLoading() => const Padding(
        padding: EdgeInsets.all(12.0),
        child: CircularProgressIndicator(color: Colors.white),
      );

  Widget buildErrorBody() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: () => controller.checkLoginState(),
          child: const Text(
            'تلاش مجدد',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      );
}
