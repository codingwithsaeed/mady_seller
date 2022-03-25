import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/offer/domain/entities/add_offer/add_offer.dart';
import 'package:mady_seller/features/offer/domain/usecases/add_offer_usecase.dart';

class AddOfferController extends GetxController with StateMixin<bool> {
  final AddOfferUsecase _addOffer;

  Rx<AddOffer> params = AddOffer(
    date: 'انتخاب تاریخ',
    sTime: 'زمان شروع',
    eTime: 'زمان پایان',
    sid: GetStorage().read('id'),
  ).obs;
  var picUploaded = false.obs;

  AddOfferController(this._addOffer);

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  Future<void> uploadPicture({
    required String name,
    required String image,
  }) async {
    change(null, status: RxStatus.loading());
    final result = await _addOffer.uploadPicture(Params({
      'action': 'upload_image',
      'name': name,
      'image': image,
    }));
    result.fold((failure) {
      change(null, status: RxStatus.error());
      showErrorSnackbar((failure as GeneralFailure).message);
    }, (link) {
      params.value.picture = link;
      change(null, status: RxStatus.error());
      showGreenSnackbar('تصویر آپلود شد');
    });
  }

  Future<void> validateFields() async {
    params.value.validate().fold(
          (error) => showErrorSnackbar(error),
          (done) async => await addOffer(),
        );
  }

  Future<void> addOffer() async {
    log(params.value.toJson().toString());
    change(null, status: RxStatus.loading());
    final result = await _addOffer(Params(params.toJson()));
    result.fold((error) {
      change(null, status: RxStatus.error());
      showErrorSnackbar((error as GeneralFailure).message);
    }, (isAdded) {
      change(isAdded, status: RxStatus.success());
      if (isAdded) {
        Get.back(result: true);
      } else {
        showErrorSnackbar('خطای غیر منتظره');
      }
    });
  }
}
