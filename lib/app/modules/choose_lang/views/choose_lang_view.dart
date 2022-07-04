import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/services/localization_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/selection_card.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../../../../../app_theme.dart';
import '../controllers/choose_lang_controller.dart';

class ChooseLangView extends GetView<ChooseLangController> {
  const ChooseLangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 75.h, horizontal: 36.w),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalKeys.kChooseLanguage.tr,
                style: Get.textTheme.bodyText2,
              ),
              Padding(
                padding: EdgeInsets.only(top: 43.h, bottom: 18.h),
                child: SelectionCard(
                  title: "العربية",
                  image: Assets.kLang,
                  isSelected: controller.isSelected.value,
                  onTap: () {
                    controller.isSelected.value = true;
                  },
                  endIcon: !controller.isSelected.value
                      ? const SizedBox.shrink()
                      : Container(
                          width: 31.w,
                          height: 31.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryColor, width: 2.w),
                          ),
                          child: Icon(
                            Icons.done,
                            color: primaryColor,
                            size: 25.r,
                          ),
                        ),
                ),
              ),
              SelectionCard(
                title: LocalizationService().isAr()?"العربية":'English',
                image: Assets.kLang,
                isSelected: !controller.isSelected.value,
                onTap: () {
                  controller.isSelected.value = true;
                },
                endIcon: controller.isSelected.value
                    ? const SizedBox.shrink()
                    :  Container(
                  width: 31.w,
                  height: 31.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor, width: 2.w),
                  ),
                  child: Icon(
                    Icons.done,
                    color: primaryColor,
                    size: 25.r,
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                title: LocalKeys.kContinue.tr,
                onPress: () {
                  if ((controller.isSelected.value &&
                          Get.locale!.languageCode == "en") ||
                      (!controller.isSelected.value &&
                          Get.locale!.languageCode != "en")) {
                    controller.onChangeLang();

                  }
                  Get.find<SharedPrefService>().saveIsFirstTime();

                  Get.offNamed(
                    Routes.LOGIN,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
