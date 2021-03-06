import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mady_seller/core/errors/failure.dart';
import 'package:mady_seller/core/network/params.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/features/reserve/domain/entities/reserve/reserve.dart';
import 'package:mady_seller/features/reserve/domain/usecases/reserves_usecase.dart';

class ReservesController extends GetxController with StateMixin<List<Reserve>> {
  final ReservesUsecase _usecase;
  var offerId = '';
  List<Reserve> lastReserves = [];

  ReservesController(this._usecase);

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  void saveId(String offerId) => this.offerId = offerId;

  Future<void> getReserves() async {
    if (offerId == '')
      change(null, status: RxStatus.error('مشکل در دریافت ...'));
    change(null, status: RxStatus.loading());
    final result = await _usecase.getReserves(
      Params({'action': 'get_offer_reserves', 'oid': offerId}),
    );
    result.fold((error) {
      if (error is GeneralFailure)
        change(null, status: RxStatus.error(error.message));
    }, (reserves) {
      if (reserves.isNotEmpty) {
        lastReserves = reserves;
        change(reserves, status: RxStatus.success());
      } else
        change(reserves, status: RxStatus.empty());
    });
  }

  Future<void> determineReserveStatus(Params params) async {
    change(null, status: RxStatus.loading());
    final result = await _usecase.determineReserveStatus(params);
    result.fold((error) {
      if (error is GeneralFailure) {
        showErrorSnackbar(error.message);
        change(lastReserves, status: RxStatus.success());
      }
    }, (isDone) async {
      change(lastReserves, status: RxStatus.success());
      await getReserves();
    });
  }
}
