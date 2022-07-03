import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/models/forget_password_model.dart';
import 'package:nourish_driver/app/data/models/login_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/auth_apis.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/custom_input.dart';
import 'package:nourish_driver/app_theme.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.kDriverLogin,
                  width: 285.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 19.h, bottom: 48.h),
                  child: Text(
                    LocalKeys.kLogin.tr,
                    style: Get.textTheme.headline2,
                  ),
                ),
                CustomInput(
                  hint: LocalKeys.kPhone.tr,
                  textEditingController: controller.phone,
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
                CustomInput(
                  hint: LocalKeys.kPassword.tr,
                  textEditingController: controller.password,
                  isPassword: true,
                  title: LocalKeys.kPassword.tr,
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.FORGET_PASSWORD);
                  },
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      LocalKeys.kForgetPassword.tr + "?",
                      style:
                          Get.textTheme.caption!.copyWith(color: primaryColor),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.h, bottom: 66.h),
              child: CustomButton(
                title: LocalKeys.kLogin.tr,
                onPress: () async{
                  print("Login try");
                  LoginModel? login =
                  await AuthApis().loginUser(controller.phone.text,controller.password.text);
                  if (login?.accessToken != null) {
                    Get.offAllNamed(Routes.HOME_SCREEN);
                    Get.snackbar(
                        "Login",'Login ===>  Success');
                  } else {
                    Get.snackbar(
                        "Login",login?.error??'error');
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
