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

  Widget buildBody(BuildContext context, Offer offer) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          XCircleLogo(logo: offer.picture!),
          if (offer.canUpdate)
            TextButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                final encodedImage = base64Encode(await image!.readAsBytes());
                final fileName = Utils.getRandomString(10);

                await controller.uploadPicture(
                    name: fileName, image: encodedImage);
              },
              child: const Text(
                'تغییر تصویر',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          const SizedBox(
            height: 10.0,
          ),
          XDetailsCard(
            name: 'محتویات بسته:',
            value: offer.content!,
            onTap: offer.canUpdate
                ? () => showMyBottomSheet(offer.oid!, 'content', 'محتویات')
                : null,
          ),
          XDetailsCard(
            name: 'قیمت اصلی:',
            value: Utils.numberFormatter(offer.price!),
            onTap: offer.canUpdate
                ? () => showMyBottomSheet(offer.oid!, 'price', 'قیمت اصلی')
                : null,
          ),
          XDetailsCard(
            name: 'درصد تخفیف:',
            value: offer.percent!,
            onTap: offer.canUpdate
                ? () => showMyBottomSheet(offer.oid!, 'percent', 'درصد تخفیف')
                : null,
          ),
          XDetailsCard(
            name: 'قیمت باتخفیف:',
            value: Utils.numberFormatter(offer.currentPrice!),
            onTap: offer.canUpdate
                ? () => showMyBottomSheet(
                    offer.oid!, 'current_price', 'قیمت باتخفیف')
                : null,
          ),
          XDetailsCard(
            name: 'تعداد:',
            value: offer.count!,
            onTap: offer.canUpdate
                ? () => showMyBottomSheet(offer.oid!, 'count', 'تعداد')
                : null,
          ),
          XDetailsCard(
            name: 'تاریخ تخفیف:',
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
            name: 'زمان شروع:',
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
                    var pickedTime = picked!.persianFormat(context);
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
            name: 'زمان پایان:',
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
                    var pickedTime = picked!.persianFormat(context);
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
            name: 'وضعیت:',
            value: pocketStatuses[int.parse(offer.status!)],
          ),
          if (offer.status != '0')
            XButton(
                color: Colors.yellow.shade800,
                onPressed: () =>
                    Get.toNamed(AppRoutes.reserve, arguments: offer.oid),
                title: 'مشاهده رزروها'),
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
                    title: 'تایید و انتشار'),
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
                    title: 'حذف'),
              ],
            ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

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
                      '$title جدید را وارد کنید ',
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
                    title: 'آپدیت',
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
