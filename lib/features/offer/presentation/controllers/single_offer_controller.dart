import 'package:get/get.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/offer/domain/entities/offer/offer.dart';
import 'package:mady_seller/features/offer/domain/usecases/single_offer_usecase.dart';

class SingleOfferController extends GetxController with StateMixin<Offer> {
  final SingleOfferUsecase _usecase;
  late Offer lastOffer;

  SingleOfferController(this._usecase);

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  void loadOffer(Offer offer) {
    lastOffer = offer;
    change(offer, status: RxStatus.success());
  }

  Future<void> updateOffer(Params params) async {
    change(null, status: RxStatus.loading());
    final result = await _usecase.updateOffer(params);
    result.fold((error) {
      showErrorSnackbar((error as GeneralFailure).message);
      change(lastOffer, status: RxStatus.success());
    }, (isUpdated) async {
      if (!isUpdated) {
        showErrorSnackbar('خطایی هنگام آپدیت رخ داد');
        change(lastOffer, status: RxStatus.success());
      } else {
        await getOffer(lastOffer.oid!);
      }
    });
  }

  Future<void> getOffer(String oid) async {
    final result = await _usecase.getOffer(
      Params({'action': 'get_offer', 'oid': oid}),
    );
    result.fold((error) {
      showErrorSnackbar((error as GeneralFailure).message);
      change(lastOffer, status: RxStatus.success());
    }, (offer) async {
      lastOffer = offer;
      change(lastOffer, status: RxStatus.success());
    });
  }

  Future<void> uploadPicture({
    required String name,
    required String image,
  }) async {
    change(null, status: RxStatus.loading());
    final result = await _usecase.uploadPicture(
      Params({
        'action': 'upload_image',
        'name': name,
        'image': image,
      }),
    );
    result.fold((failure) {
      change(lastOffer, status: RxStatus.success());
      showErrorSnackbar((failure as GeneralFailure).message);
    }, (link) {
      updateOffer(Params({
        'action': 'update_offer_picture',
        'oid': lastOffer.oid,
        'picture': link,
        'current_picture': lastOffer.picture
      }));
    });
  }

  Future<void> determineOfferStatus(Params params) async {
    final result = await _usecase.determineOfferStatus(params);
    result.fold((error) {
      showErrorSnackbar((error as GeneralFailure).message);
      change(lastOffer, status: RxStatus.success());
    }, (isDone) {
      Get.back();
    });
  }
}

extension BetterOffer on Offer {
  bool get canUpdate => status == '0';
}
