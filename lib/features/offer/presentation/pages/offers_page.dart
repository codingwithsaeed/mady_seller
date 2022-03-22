// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/presentation/controller/offers_controller.dart';

class OffersPage extends GetView<OffersController> {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.status.isError && controller.state == null)
        Get.offNamed(AppRoutes.login);
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.yellow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: const Text('مادی فروشنده'),
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
              // await GetStorage().remove('id');
              await controller.getSellerId();
            },
            icon: const Icon(Icons.person_rounded, color: Colors.white),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: (() async => await controller.getSellerId()),
        child: controller.obx(
            (state) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0),
                    itemBuilder: ((_, index) => ListItem(offer: state![index])),
                    itemCount: state!.length,
                  ),
                ),
            onError: ((error) => Center(child: Text(error!))),
            onLoading: Center(
              child: CircularProgressIndicator(color: Colors.amber.shade800),
            ),
            onEmpty: const Center(child: Text('هیچ آفری ندارید!'))),
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

class ListItem extends StatelessWidget {
  final Offer offer;
  const ListItem({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 10.0,
      shadowColor: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(offer.picture),
          ),
          Text(
            offer.content,
            maxLines: 1,
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
