import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../../../app_theme.dart';
import '../controllers/otp_verification_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 95.w,
        ),
        centerTitle: true,
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text(
              LocalKeys.kFillOTP.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.w),
              child: Text(
                "${LocalKeys.kSentVerificationCode.tr} ${LocalKeys.kMobileNumber.tr} +1 322 322 445",
                textAlign: TextAlign.center,
                style: Get.textTheme.headline3!.copyWith(fontSize: 16.sp),
              ),
            ),
            PinInputTextField(
              pinLength: 4,
              decoration: BoxLooseDecoration(
                textStyle: Get.textTheme.bodyText2,
                strokeColorBuilder: PinListenColorBuilder(
                  lightGreyColor,
                  lightGreyColor,
                ),
                bgColorBuilder: PinListenColorBuilder(
                  Colors.white,
                  Colors.white,
                ),
              ),
              controller: controller.otp,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              onSubmit: (pin) {},
              onChanged: (pin) {},
              enableInteractiveSelection: false,
            ),
            Padding(
              padding: EdgeInsets.only(top: 39.h, bottom: 19.h),
              child: CustomButton(
                title: LocalKeys.kContinue.tr,
                onPress: () {
                  Get.toNamed(Routes.NEW_PASSWORD);
                },
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocalKeys.kResendOTPAgain.tr,
                  style: Get.textTheme.headline3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
