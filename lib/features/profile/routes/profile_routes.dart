import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/profile/binding/profile_binding.dart';
import 'package:mady_seller/features/profile/presentation/pages/profile_page.dart';

List<GetPage> profileRoutes = [
  GetPage(
    name: AppRoutes.profile,
    page: () => const ProfilePage(),
    binding: ProfileBinding(),
  ),
];