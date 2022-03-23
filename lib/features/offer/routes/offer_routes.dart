import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/offer/binding/add_offer_binding.dart';
import 'package:mady_seller/features/offer/binding/offers_binding.dart';
import 'package:mady_seller/features/offer/presentation/pages/add_offer_page.dart';
import 'package:mady_seller/features/offer/presentation/pages/offers_page.dart';

List<GetPage> offerRoutes = [
  GetPage(
    name: AppRoutes.offers,
    page: () => const OffersPage(),
    binding: OffersBinding(),
  ),
  GetPage(
    name: AppRoutes.addOffer,
    page: () => const AddOfferPage(),
    binding: AddOfferBinding(),
  ),
];
