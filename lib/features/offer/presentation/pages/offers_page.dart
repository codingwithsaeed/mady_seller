import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/features/offer/presentation/controller/offers_controller.dart';

class OffersPage extends GetView<OffersController> {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(GetStorage().read('id'));

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
      body: const SizedBox(
        child: Center(child: Text('Main Page')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.yellow.shade900,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
