import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mady_seller/core/routes/app_pages.dart';
import 'package:mady_seller/core/utils/consts.dart' as consts;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: consts.localizationDelegate,
        locale: const Locale('fa'),
        theme: consts.themeData,
        defaultTransition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 700),
        initialRoute: AppPages.initialRoute,
        getPages: AppPages.pages,
      );
}