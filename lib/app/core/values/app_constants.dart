import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nourish_driver/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';
String? token = Get.find<SharedPrefService>().getToken() ?? '';
NetworkService networkService = NetworkService(
  baseUrl: AppConstants.kBaseUrl,
  httpHeaders: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  },
);

class AppConstants {
  static const String kBaseUrl = "api-driver.eat-nourish.com";
  const AppConstants._();
}
