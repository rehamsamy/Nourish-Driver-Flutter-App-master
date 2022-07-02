import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/modules/profile/controllers/profile_controller.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';

import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../../../app_theme.dart';

class OTPDialog extends GetView<ProfileController> {
  const OTPDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      content: Container(
        width: 362.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 34.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalKeys.kFillOTP.tr,
              style: Get.textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.5.h, bottom: 40.h),
              child: SizedBox(
                width: Get.width,
                height: 2.h,
                child: OverflowBox(
                  maxWidth: 342.w,
                  minWidth: 342.w,
                  maxHeight: 2.h,
                  child: const Divider(
                    color: lightGreyColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.w),
              child: Text(
                "${LocalKeys.kSentVerificationCode.tr} ${LocalKeys.kMobileNumber.tr} +1 322 322 445",
                textAlign: TextAlign.center,
                style: Get.textTheme.headline3,
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
              padding: EdgeInsets.only(
                top: 40.h,
                bottom: 19.h,
              ),
              child: CustomButton(
                title: LocalKeys.kConfirm.tr,
                onPress: () {
                  Get.back();
                },
              ),
            ),
            InkWell(
              child: Text(
                LocalKeys.kResendOTPAgain.tr,
                style: Get.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
