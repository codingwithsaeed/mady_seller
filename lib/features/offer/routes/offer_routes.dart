import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/offer/presentation/pages/offers_page.dart';

List<GetPage> offerRoutes = [
  GetPage(
    name: AppRoutes.home,
    page: () => const OffersPage(),
  ),
];
