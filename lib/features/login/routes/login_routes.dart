import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/login/binding/login_binding.dart';
import 'package:mady_seller/features/login/presentation/pages/login_page.dart';

List<GetPage> loginRoutes = [
  GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding()),
];
