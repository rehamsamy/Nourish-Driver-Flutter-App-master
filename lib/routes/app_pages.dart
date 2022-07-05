import 'package:get/get.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../app/modules/choose_lang/bindings/choose_lang_binding.dart';
import '../app/modules/choose_lang/views/choose_lang_view.dart';
import '../app/modules/forget_password/bindings/forget_password_binding.dart';
import '../app/modules/forget_password/views/forget_password_view.dart';
import '../app/modules/home_screen/bindings/home_screen_binding.dart';
import '../app/modules/home_screen/views/home_screen_view.dart';
import '../app/modules/login/bindings/login_binding.dart';
import '../app/modules/login/views/login_view.dart';
import '../app/modules/new_password/bindings/new_password_binding.dart';
import '../app/modules/new_password/views/new_password_view.dart';
import '../app/modules/order_details/bindings/order_details_binding.dart';
import '../app/modules/order_details/views/order_details_view.dart';
import '../app/modules/orders/bindings/orders_binding.dart';
import '../app/modules/orders/views/orders_view.dart';
import '../app/modules/otp_verification/bindings/otp_verification_binding.dart';
import '../app/modules/otp_verification/views/otp_verification_view.dart';
import '../app/modules/profile/bindings/profile_binding.dart';
import '../app/modules/profile/views/profile_view.dart';
import '../app/modules/reset_password/bindings/reset_password_binding.dart';
import '../app/modules/reset_password/views/reset_password_view.dart';
import '../app/modules/splash/bindings/splash_binding.dart';
import '../app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String token = Get.find<SharedPrefService>().getToken() ?? '';

  static const INITIAL =Routes.SPLASH;


  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => token == '' ?  const SplashView() :   const HomeScreenView(),
      binding: token == '' ? SplashBinding() : HomeScreenBinding(),
      // page: () => const SplashView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LANG,
      page: () => const ChooseLangView(),
      binding: ChooseLangBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () =>  NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () =>  ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
  ];
}
