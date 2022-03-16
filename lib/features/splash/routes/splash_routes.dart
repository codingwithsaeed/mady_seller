import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/splash/binding/splash_binding.dart';
import 'package:mady_seller/features/splash/presentation/pages/splash_page.dart';

List<GetPage> splashRoutes = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashPage(),
    binding: SplashBinding(),
  ),
];