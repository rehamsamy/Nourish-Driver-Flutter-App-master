import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/custom_input.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  NewPasswordView({Key? key}) : super(key: key);
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.kLogo,
              width: 200.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              LocalKeys.kCreateNewPassword.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 44.h),
              child: CustomInput(
                hint: LocalKeys.kNewPassword.tr,
                textEditingController: controller.password,
                title: LocalKeys.kNewPassword.tr,
                suffixIcon: Assets.kPasswordIcon,
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return LocalKeys.kRequiredField.tr;
                  } else if (value != null && value.length < 8) {
                    return LocalKeys.kPasswordLength.tr;
                  }
                  return null;
                },
              ),
            ),
            CustomInput(
              hint: LocalKeys.kReNewPassword.tr,
              textEditingController: controller.rePassword,
              title: LocalKeys.kReNewPassword.tr,
              suffixIcon: Assets.kPasswordIcon,
              validator: (value) {
                if (value != null && value.trim().isEmpty) {
                  return LocalKeys.kRequiredField.tr;
                } else if (value != password.text) {
                  return LocalKeys.kPasswordsNoMatch.tr;
                } else if (value != null && value.length < 8) {
                  return LocalKeys.kPasswordLength.tr;
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 39.h, bottom: 19.h),
              child: CustomButton(
                title: LocalKeys.ksave.tr,
                onPress: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
