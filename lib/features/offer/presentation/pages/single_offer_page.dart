import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/core/utils/utils.dart';
import 'package:mady_seller/core/x/x_widgets.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/presentation/controllers/single_offer_controller.dart';
import 'package:mady_seller/features/offer/presentation/pages/add_offer_page.dart';
import 'package:mady_seller/responsive.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class SingleOfferPage extends GetView<SingleOfferController> {
  const SingleOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Offer offer = ModalRoute.of(context)!.settings.arguments as Offer;
    controller.loadOffer(offer);

    return controller.obx(
        (state) => Scaffold(
              appBar: buildAppbar(state!),
              body: buildBody(context, state),
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
          ),
        ),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          offer.content!,
          textDirection: TextDirection.ltr,
        ),
      );

  Widget buildBody(BuildContext context, Offer offer) {
    return Responsive(
        mobile: onMobile(context, offer),
        tablet: onDesktop(context, offer),
        desktop: onDesktop(context, offer));
  }

  Widget onDesktop(BuildContext context, Offer offer) {
    return SafeArea(
        child: Row(
      children: [
        Expanded(
          flex: Responsive.isTablet(context) ? 1 : 2,
          child: Container(
            color: Colors.yellow.shade800,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  XCircleLogo(
                    logo: offer.picture!,
                    radius: Responsive.isTablet(context) ? 110 : 150.0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (offer.canUpdate)
                    TextButton(
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        final encodedImage =
                            base64Encode(await image!.readAsBytes());
                        final fileName = Utils.getRandomString(10);

                        await controller.uploadPicture(
                            name: fileName, image: encodedImage);
                      },
                      child: const Text(
                        '?????????? ??????????',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            flex: Responsive.isTablet(context) ? 1 : 1,
            child: onMobile(context, offer)),
      ],
    ));
  }

  Widget onMobile(BuildContext context, Offer offer) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (Responsive.isMobile(context))
              const SizedBox(
                height: 10.0,
              ),
            if (Responsive.isMobile(context)) XCircleLogo(logo: offer.picture!),
            if (offer.canUpdate)
              if (Responsive.isMobile(context))
                TextButton(
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    final encodedImage =
                        base64Encode(await image!.readAsBytes());
                    final fileName = Utils.getRandomString(10);

                    await controller.uploadPicture(
                        name: fileName, image: encodedImage);
                  },
                  child: const Text(
                    '?????????? ??????????',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
            const SizedBox(
              height: 10.0,
            ),
            XDetailsCard(
              name: '?????????????? ????????:',
              value: offer.content!,
              onTap: offer.canUpdate
                  ? () => showMyBottomSheet(offer.oid!, 'content', '??????????????')
                  : null,
            ),
            XDetailsCard(
              name: '???????? ????????:',
              value: Utils.numberFormatter(offer.price!),
              onTap: offer.canUpdate
                  ? () => showMyBottomSheet(offer.oid!, 'price', '???????? ????????')
                  : null,
            ),
            XDetailsCard(
              name: '???????? ??????????:',
              value: offer.percent!,
              onTap: offer.canUpdate
                  ? () => showMyBottomSheet(offer.oid!, 'percent', '???????? ??????????')
                  : null,
            ),
            XDetailsCard(
              name: '???????? ??????????????:',
              value: Utils.numberFormatter(offer.currentPrice!),
              onTap: offer.canUpdate
                  ? () => showMyBottomSheet(
                      offer.oid!, 'current_price', '???????? ??????????????')
                  : null,
            ),
            XDetailsCard(
              name: '??????????:',
              value: offer.count!,
              onTap: offer.canUpdate
                  ? () => showMyBottomSheet(offer.oid!, 'count', '??????????')
                  : null,
            ),
            XDetailsCard(
              name: '?????????? ??????????:',
              value: offer.date!,
              onTap: offer.canUpdate
                  ? () async {
                      Jalali? picked = await showPersianDatePicker(
                        context: context,
                        initialDate: Jalali(
                          int.parse(offer.date!.split('-')[0]),
                          int.parse(offer.date!.split('-')[1]),
                          int.parse(offer.date!.split('-')[2]),
                        ),
                        firstDate: Jalali.now(),
                        lastDate: Jalali(1401, 12, 29),
                      );
                      String pickedDate =
                          picked!.formatCompactDate().replaceAll("/", "-");
                      await controller.updateOffer(
                        Params({
                          'action': 'update_offer_date',
                          'oid': offer.oid,
                          'date': pickedDate
                        }),
                      );
                    }
                  : null,
            ),
            XDetailsCard(
              name: '???????? ????????:',
              value: offer.sTime!,
              onTap: offer.canUpdate
                  ? () async {
                      var picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                          hour: int.parse(offer.sTime!.split(':')[0]),
                          minute: int.parse(offer.sTime!.split(':')[1]),
                        ),
                      );
                      var pickedTime = picked!.myPersianFormat(context);
                      await controller.updateOffer(Params({
                        'action': 'update_offer_time',
                        'oid': offer.oid,
                        'sTime': pickedTime,
                        'eTime': offer.eTime,
                      }));
                    }
                  : null,
            ),
            XDetailsCard(
              name: '???????? ??????????:',
              value: offer.eTime!,
              onTap: offer.canUpdate
                  ? () async {
                      var picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                          hour: int.parse(offer.eTime!.split(':')[0]),
                          minute: int.parse(offer.eTime!.split(':')[1]),
                        ),
                      );
                      var pickedTime = picked!.myPersianFormat(context);
                      await controller.updateOffer(Params({
                        'action': 'update_offer_time',
                        'oid': offer.oid,
                        'sTime': offer.sTime,
                        'eTime': pickedTime,
                      }));
                    }
                  : null,
            ),
            XDetailsCard(
              name: '??????????:',
              value: pocketStatuses[int.parse(offer.status!)],
            ),
            if (offer.status != '0')
              XButton(
                  color: Colors.yellow.shade800,
                  onPressed: () =>
                      Get.toNamed(AppRoutes.reserve, arguments: offer.oid),
                  title: '???????????? ????????????'),
            if (offer.status == '0')
              Row(
                children: [
                  XAcceptanceButton(
                      color: Colors.green.shade700,
                      onPressed: () async {
                        await controller.determineOfferStatus(
                          Params({'action': 'confirm_offer', 'oid': offer.oid}),
                        );
                      },
                      title: '?????????? ?? ????????????'),
                  XAcceptanceButton(
                      color: Colors.red.shade700,
                      onPressed: () async {
                        await controller.determineOfferStatus(
                          Params({
                            'action': 'deny_offer',
                            'oid': offer.oid,
                            'picture': offer.picture
                          }),
                        );
                      },
                      title: '??????'),
                ],
              ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );

  void showMyBottomSheet(String oid, String field, String title) {
    var newValue = '';
    Get.bottomSheet(
      Wrap(
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$title ???????? ???? ???????? ???????? ',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  XHintTextField(
                    hint: '',
                    autoFocus: true,
                    onChanged: (value) => newValue = value,
                  ),
                  XButton(
                    onPressed: () {
                      var params = Params({
                        'action': 'update_offer_$field',
                        'oid': oid,
                        field: newValue,
                      });

                      controller.updateOffer(params);
                      Get.back();
                    },
                    title: '??????????',
                    color: Colors.yellow.shade800,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      isScrollControlled: true,
    );
  }
}
