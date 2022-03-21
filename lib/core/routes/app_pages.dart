import 'package:get/route_manager.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/offer/routes/offer_routes.dart';
import 'package:mady_seller/features/login/routes/login_routes.dart';
import 'package:mady_seller/features/splash/routes/splash_routes.dart';

class AppPages {
  static String get initialRoute => AppRoutes.splash;

  static List<GetPage> get pages => [
        ...splashRoutes,
        ...loginRoutes,
        ...offerRoutes,
      ];
}
