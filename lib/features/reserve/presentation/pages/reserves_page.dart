import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/features/reserve/domain/entities/reserve/reserve.dart';
import 'package:mady_seller/features/reserve/presentation/controllers/reserves_controller.dart';

class ReservesPage extends GetView<ReservesController> {
  const ReservesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String offerId = ModalRoute.of(context)!.settings.arguments as String;
    getData(offerId);
    return Scaffold(
      appBar: buildAppbar(),
      body: controller.obx(
        (state) => buildBody(context, state!),
        onEmpty: buildText('هیچ درخواست رزروی ثبت نشده است'),
        onLoading: buildLoading(),
        onError: (error) => buildText(error!),
      ),
    );
  }

  Future<void> getData(String id) async {
    controller.saveId(id);
    controller.getReserves();
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20.0),
        ),
      );

  Widget buildBody(BuildContext context, List<Reserve> list) =>
      RefreshIndicator(
          child: ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(list[index].name),
              ),
            );
          }),
          onRefresh: () async => await controller.getReserves());

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(color: Colors.amber.shade800),
      );

  AppBar buildAppbar() => AppBar(
        elevation: 10,
        shadowColor: Colors.yellow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'رزروها',
        ),
      );
}
