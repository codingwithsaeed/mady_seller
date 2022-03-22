import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/offer/presentation/controller/offers_controller.dart';

class OffersPage extends GetView<OffersController> {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.status.isError) Get.offNamed(AppRoutes.login);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('مادی فروشنده'),
        centerTitle: false,
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.filter_alt_rounded, color: Colors.white),
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('همه')),
                    const PopupMenuItem(child: Text('فعال')),
                    const PopupMenuItem(child: Text('پیش نمایش')),
                    const PopupMenuItem(child: Text('تمام شده')),
                  ]),
          IconButton(
            onPressed: () async {
              await GetStorage().remove('id');
            },
            icon: const Icon(
              Icons.settings_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: controller.obx(
        (state) {
          return const SizedBox(child: Center(child: Text('Main Page')));
        },
        onError: ((error) {
          return const SizedBox(child: Center(child: Text('Main Page')));
        }),
        onLoading: CircularProgressIndicator(color: Colors.amber.shade900,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.yellow.shade800,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
