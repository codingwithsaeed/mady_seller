import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/core/utils/consts.dart';
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
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => ReserveListItem(
              reserve: list[index],
              onAccept: () => controller.determineReserveStatus(
                Params({
                  'action': 'receive_reserve',
                  'rid': list[index].rid,
                }),
              ),
              onDeny: () => controller.determineReserveStatus(
                Params({
                  'action': 'cancel_reserve',
                  'rid': list[index].rid,
                  'oid': list[index].oid,
                  'count': list[index].count,
                }),
              ),
            ),
          ),
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

class ReserveListItem extends StatelessWidget {
  final Reserve reserve;
  final VoidCallback? onAccept;
  final VoidCallback? onDeny;

  const ReserveListItem({
    Key? key,
    required this.reserve,
    this.onAccept,
    this.onDeny,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(8.0),
          childrenPadding:
              const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          title: Row(
            children: [
              Text(
                reserve.name,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(width: 10),
              const Text(
                'تعداد درخواستی:',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(width: 10),
              Text(
                reserve.count,
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          children: [
            Row(
              children: [
                const Text(
                  'شماره رسید:',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(width: 10),
                Text(
                  reserve.receipt,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'وضعیت:',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(width: 10),
                Text(
                  reserveStatusTitle[int.parse(reserve.status)],
                  style: TextStyle(
                      fontSize: 18.0,
                      color: reserve.isNotDelivered
                          ? Colors.yellow.shade800
                          : reserve.status == '1'
                              ? Colors.green.shade800
                              : Colors.red.shade800),
                ),
              ],
            ),
            if (reserve.isNotDelivered)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: onAccept,
                    child: Text(
                      'تحویل دادن',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onDeny,
                    child: Text(
                      'لغو کردن',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red.shade800,
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

extension BetterReserve on Reserve {
  bool get isNotDelivered => status == '0';
}
