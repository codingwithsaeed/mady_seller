import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/features/splash/presentation/controller/splash_controller.dart';

class SplashPage extends GetWidget<SplashController> {
  static const id = '/SplashPage';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            GetBuilder<SplashController>(builder: (_) {
              if (!controller.isLoaded) {
                return const Padding(
                  padding: EdgeInsets.all(22.0),
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              if (controller.errorText.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () => controller.callCheckByDelay(2),
                    child: const Text(
                      'تلاش مجدد',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                );
              }
              return const SizedBox(
                height: 10,
              );
            }),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
