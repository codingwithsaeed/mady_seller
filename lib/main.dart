import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/routes/app_pages.dart';
import 'package:mady_seller/core/utils/consts.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: localizationDelegate,
        locale: const Locale('fa'),
        theme: themeData,
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500),
        initialRoute: AppPages.initialRoute,
        getPages: AppPages.pages,
      );
}
