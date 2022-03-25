import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/core/utils/utils.dart';
import 'package:mady_seller/core/x/x_widgets.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/presentation/controllers/single_offer_controller.dart';

class SingleOfferPage extends GetView<SingleOfferController> {
  const SingleOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Offer offer = ModalRoute.of(context)!.settings.arguments as Offer;
    controller.loadOffer(offer);

    return controller.obx(
        (state) => Scaffold(
              appBar: buildAppbar(state!),
              body: buildBody(state),
            ),
        onError: (error) => buildErrorBody(error!),
        onLoading: buildLoading(),
        onEmpty: buildEmpty());
  }

  Widget buildEmpty() => const Scaffold(
        body: Center(),
      );

  Widget buildLoading() => Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.yellow.shade800,
          ),
        ),
      );

  Widget buildErrorBody(String error) => Scaffold(
        body: Center(
          child: Text(error),
        ),
      );

  AppBar buildAppbar(Offer offer) => AppBar(
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
        title: Text(
          offer.content!,
          textDirection: TextDirection.ltr,
        ),
      );

  Widget buildBody(Offer offer) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          XCircleLogo(logo: offer.picture!),
          const SizedBox(
            height: 10.0,
          ),
          XDetailsCard(
            name: 'محتویات بسته:',
            value: offer.content!,
            onTap: offer.canUpdate
                ? () {
                    showGreenSnackbar('آپدیت کردن');
                  }
                : null,
          ),
          XDetailsCard(
            name: 'قیمت اصلی:',
            value: Utils.numberFormatter(offer.price!),
          ),
          XDetailsCard(
            name: 'درصد تخفیف:',
            value: offer.percent!,
          ),
          XDetailsCard(
            name: 'قیمت باتخفیف:',
            value: Utils.numberFormatter(offer.currentPrice!),
          ),
          XDetailsCard(
            name: 'تاریخ تخفیف:',
            value: offer.date!,
          ),
          XDetailsCard(
            name: 'زمان شروع:',
            value: offer.sTime!,
          ),
          XDetailsCard(
            name: 'زمان پایان:',
            value: offer.eTime!,
          ),
          XDetailsCard(
            name: 'وضعیت:',
            value: pocketStatuses[int.parse(offer.status!)],
          ),
          if (offer.status != '0')
            XButton(
                color: Colors.yellow.shade800,
                onPressed: () {},
                title: 'مشاهده رزروها'),
          if (offer.status == '0')
            Row(
              children: [
                XAcceptanceButton(
                    color: Colors.green.shade700,
                    onPressed: () {},
                    title: 'تایید و انتشار'),
                XAcceptanceButton(
                    color: Colors.red.shade700, onPressed: () {}, title: 'حذف'),
              ],
            ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
