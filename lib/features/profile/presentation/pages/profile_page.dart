import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/core/x/x_widgets.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/profile/presentation/controllers/profile_controller.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'حساب کاربری',
        ),
      ),
      body: controller.obx((state) => buildBody(state!),
          onEmpty: const Center(),
          onLoading: buildLoading(),
          onError: (error) => Center(
                child: Text(error!),
              )),
    );
  }

  Widget buildLoading() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: CircularProgressIndicator(color: Colors.yellow.shade800),
      );

  Widget buildBody(Seller seller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          XCircleLogo(logo: seller.logo),
          const SizedBox(
            height: 10.0,
          ),
          XDetailsCard(
            name: 'نام فروشگاه:',
            value: seller.storeName,
          ),
          XDetailsCard(
            name: 'شماره موبایل:',
            value: seller.phone.replaceFirst('+98', '0'),
          ),
          XDetailsCard(
            name: 'دسته بندی:',
            value: seller.category,
          ),
          XDetailsCard(
            name: 'آدرس:',
            value: seller.address,
          ),
          // Card(
          //   child: SizedBox(
          //     width: double.infinity,
          //     height: 200,
          //     child: GoogleMap(
          //       initialCameraPosition: CameraPosition(
          //         target: LatLng(
          //           double.parse(seller.lat),
          //           double.parse(seller.lng),
          //         ),
          //         zoom: 16.8,
          //       ),
          //     ),
          //   ),
          // ),
          XDetailsCard(
            name: 'بسته:',
            value: pocketTitles[int.parse(seller.pocket)],
          ),
          XDetailsCard(
            name: 'آفرهای باقیمانده:',
            value: seller.offerCount,
          ),
          XDetailsCard(
            name: 'انقضای بسته:',
            value: seller.expire,
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
