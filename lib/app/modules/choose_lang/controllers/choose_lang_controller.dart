import 'package:get/get.dart';
import 'package:nourish_driver/app/data/services/localization_service.dart';

class ChooseLangController extends GetxController {
  RxBool isSelected =
      Get.find<LocalizationService>().isAr() ? true.obs : false.obs;

  onChangeLang() {
    Get.find<LocalizationService>()
        .setLocale(!Get.find<LocalizationService>().isAr() ? "ar" : "en");
    update();
  }
}
