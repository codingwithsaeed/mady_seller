import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/core/utils/consts.dart';
import 'package:mady_seller/core/x/x_widgets.dart';
import 'package:mady_seller/features/login/domain/entities/seller/seller.dart';
import 'package:mady_seller/features/profile/presentation/controllers/profile_controller.dart';
import 'package:mady_seller/responsive.dart';

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
          ),
        ),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'حساب کاربری',
        ),
      ),
      body: controller.obx((state) => buildBody(context, state!),
          onEmpty: const Center(),
          onLoading: buildLoading(),
          onError: (error) => Center(
                child: Text(error!),
              )),
    );
  }

  Widget buildLoading() => Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircularProgressIndicator(color: Colors.yellow.shade800),
        ),
      );

  Widget buildBody(BuildContext context, Seller seller) {
    return Responsive(
        mobile: onMobile(context, seller),
        tablet: onDesktop(context, seller),
        desktop: onDesktop(context, seller));
  }

  Widget onDesktop(BuildContext context, Seller seller) {
    return SafeArea(
        child: Row(
      children: [
        Expanded(
          flex: Responsive.isTablet(context) ? 1 : 2,
          child: Container(
            color: Colors.yellow.shade800,
            child: Center(
              child: XCircleLogo(
                logo: seller.logo,
                radius: Responsive.isTablet(context) ? 110 : 150.0,
              ),
            ),
          ),
        ),
        Expanded(
            flex: Responsive.isTablet(context) ? 1 : 1,
            child: onMobile(context, seller)),
      ],
    ));
  }

  Widget onMobile(BuildContext context, Seller seller) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (Responsive.isMobile(context))
              const SizedBox(
                height: 10.0,
              ),
            if (Responsive.isMobile(context)) XCircleLogo(logo: seller.logo),
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
            XButton(
              onPressed: () async {
                await GetStorage().remove('id');
                Get.offAllNamed(AppRoutes.login);
              },
              title: 'خروج از حساب کاربری',
              color: Colors.yellow.shade800,
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );
}
