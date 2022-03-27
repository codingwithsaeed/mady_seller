import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/reserve/binding/reserve_binding.dart';
import 'package:mady_seller/features/reserve/presentation/pages/reserves_page.dart';

List<GetPage> reserveRoutes = [
  GetPage(
    name: AppRoutes.reserve,
    page: () => const ReservesPage(),
    binding: ReserveBinding(),
  ),
];
