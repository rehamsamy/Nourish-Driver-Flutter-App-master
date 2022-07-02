import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/custom_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({Key? key}) : super(key: key);
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kResetPassword.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 35.h),
          child: Column(
            children: [
              CustomInput(
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
              CustomInput(
                hint: LocalKeys.kRenewPassword.tr,
                textEditingController: controller.password,
                title: LocalKeys.kRenewPassword.tr,
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
              const Spacer(),
              CustomButton(
                title: LocalKeys.ksave.tr,
                onPress: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
