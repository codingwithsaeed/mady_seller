import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/core/utils/utils.dart';
import 'package:mady_seller/features/offer/presentation/controllers/add_offer_controller.dart';
import 'package:mady_seller/responsive.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../core/x/x_widgets.dart';

extension TimeOfDayExt24 on TimeOfDay {
  String myPersianFormat(context) {
    return formatTimeOfDay(
      this,
      alwaysUse24HourFormat: true,
    );
  }
}

class AddOfferPage extends GetView<AddOfferController> {
  const AddOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 10,
          shadowColor: Colors.yellow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
            ),
          ),
          title: const Text('افزودن آفر'),
        ),
        body: Responsive(
            mobile: onMobile(context),
            tablet: onDesktop(context),
            desktop: onDesktop(context)));
  }

  Widget onMobile(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            XLableTextField(
                lable: 'محتویات بسته را وارد کنید',
                onChanged: (data) =>
                    controller.params.update((val) => val!.content = data),
                validator: (text) {
                  if (text == null || text.isEmpty)
                    return 'محتویات بسته را وارد کنید';
                  return null;
                }),
            Obx(
              () => XButton(
                onPressed: () async {
                  Jalali? picked = await showPersianDatePicker(
                    context: context,
                    initialDate: Jalali.now(),
                    firstDate: Jalali(1401, 1),
                    lastDate: Jalali(1401, 12, 29),
                  );
                  String pickedDate =
                      picked!.formatCompactDate().replaceAll("/", "-");
                  controller.params.update((val) => val!.date = pickedDate);
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                title: controller.params.value.date!,
                color: Colors.yellow.shade800,
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: XButton(
                      onPressed: () async {
                        var picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        var pickedTime = picked!.myPersianFormat(context);
                        controller.params
                            .update((val) => val!.sTime = pickedTime);
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      title: controller.params.value.sTime!,
                      color: Colors.yellow.shade800,
                    ),
                  ),
                  Expanded(
                    child: XButton(
                      onPressed: () async {
                        var picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        var pickedTime = picked!.myPersianFormat(context);
                        controller.params
                            .update((val) => val!.eTime = pickedTime);
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      title: controller.params.value.eTime!,
                      color: Colors.yellow.shade800,
                    ),
                  ),
                ],
              ),
            ),
            XLableTextField(
                lable: 'قیمت اصلی',
                onChanged: (data) => controller.params.value.price = data,
                validator: (text) {
                  if (text == null || text.isEmpty)
                    return 'قیمت اصلی را وارد کنید';
                  return null;
                }),
            XLableTextField(
                lable: 'درصد تخفیف',
                onChanged: (data) => controller.params.value.percent = data,
                validator: (text) {
                  if (text == null || text.isEmpty)
                    return 'درصد تخفیف را وارد کنید';
                  return null;
                }),
            XLableTextField(
                lable: 'قیمت با تخفیف',
                onChanged: (data) =>
                    controller.params.value.currentPrice = data,
                validator: (text) {
                  if (text == null || text.isEmpty)
                    return 'قیمت با تخفیف را وارد کنید';
                  return null;
                }),
            XLableTextField(
                lable: 'تعداد را وارد کنید',
                onChanged: (data) => controller.params.value.count = data,
                validator: (text) {
                  if (text == null || text.isEmpty) return 'تعداد را وارد کنید';
                  return null;
                }),
            XButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                final encodedImage = base64Encode(await image!.readAsBytes());
                final fileName = Utils.getRandomString(10);

                await controller.uploadPicture(
                    name: fileName, image: encodedImage);
              },
              title: 'بارگذاری تصویر',
              color: Colors.yellow.shade800,
            ),
            XDropDown<String>(
              hint: 'انتخاب نوع آفر',
              value: controller.params.value.isSpecial,
              items: offerTypes,
              height: 65,
              onChanged: (value) => controller.params.value.isSpecial = value,
            ),
            XDropDown<String>(
              hint: 'انتخاب وضعیت',
              value: controller.params.value.status,
              items: offerStatus,
              height: 65,
              onChanged: (value) => controller.params.value.status = value,
            ),
            controller.obx(
              (state) => returnButton(),
              onError: (error) => returnButton(),
              onLoading: Center(
                child: CircularProgressIndicator(color: Colors.amber.shade800),
              ),
              onEmpty: returnButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget onDesktop(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: Responsive.isTablet(context) ? 5 : 2,
          child: Container(
            color: Colors.yellow.shade800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 3,
                ),
                Center(
                  child: Text(
                    'لطفا تمام موارد را با دقت وارد نمایید',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.isTablet(context) ? 23 : 40.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: onMobile(context),
          flex: Responsive.isTablet(context) ? 4 : 1,
        )
      ],
    );
  }

  Widget returnButton() => XButton(
        onPressed: () async {
          FocusManager.instance.primaryFocus!.unfocus();
          await controller.validateFields();
        },
        title: 'ثبت آفر',
        color: Colors.yellow.shade800,
      );

  void cubitListener(context, state) {
    // if (state is OfferPictureLoaded) {
    //   FocusManager.instance.primaryFocus!.unfocus();
    //   setState(() => offer.picture = state.link);
    //   showSnackbar(context, message: 'تصویر آپلود شد.', color: Colors.green);
    // }
    // if (state is OfferError) {
    //   FocusManager.instance.primaryFocus!.unfocus();
    //   showSnackbar(context, message: state.message);
    // }
    // if (state is AddOfferSuccess) Navigator.pop(context, true);
  }

  // Widget cubitBuilder(context, state) {
  //   if (state is OfferLoading)
  //     return const Center(child: CircularProgressIndicator(color: Colors.red));
  // }
}
