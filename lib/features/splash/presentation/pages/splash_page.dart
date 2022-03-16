import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mady_seller/features/login/presentation/pages/login_page.dart';

class SplashPage extends StatelessWidget {
  static const id = '/SplashPage';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 1500),
      () => Get.offNamed(LoginPage.id),
    );
    return Scaffold(
      backgroundColor: Colors.amber.shade700,
      body: const Center(
        child: Image(
          image: AssetImage('assets/images/sale-white.png'),
        ),
      ),
    );
  }
}
