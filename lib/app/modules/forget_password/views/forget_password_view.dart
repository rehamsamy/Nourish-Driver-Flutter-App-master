import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/custom_input.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
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
              LocalKeys.kForgetPassword.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 44.h),
              child: CustomInput(
                hint: LocalKeys.kPhone.tr,
                textEditingController: controller.email,
                title: LocalKeys.kPhone.tr,
                suffixIcon: Assets.kPhone,
                textInputType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return LocalKeys.kRequiredField.tr;
                  } else if (value != null && value.length < 10) {
                    return LocalKeys.kPhoneLength.tr;
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 39.h, bottom: 19.h),
              child: CustomButton(
                title: LocalKeys.ksave.tr,
                onPress: () {
                  Get.toNamed(Routes.OTP_VERIFICATION);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
