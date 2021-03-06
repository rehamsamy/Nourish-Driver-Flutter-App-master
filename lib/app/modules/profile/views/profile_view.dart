import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/models/update_profile_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/profile_apis.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/custom_input.dart';
import 'package:nourish_driver/app/shared/custom_network_image.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../../../../app_theme.dart';
import '../controllers/profile_controller.dart';
import 'otp_dialog.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text(LocalKeys.kSetting.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: GetBuilder<ProfileController>(
        builder: (_)=> SizedBox(
          width: Get.width,
          height: Get.height,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 36.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 113.w,
                  height: 113.w,
                  child: Stack(
                    children: [
                      Container(
                        width: 113.w,
                        height: 150.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: greyColor,
                        ),
                        child: CustomNetworkImage(
                          height: 40,
                          width: 40,
                          imageUrl: controller.profileModel?.image??'',
                          errorWidget: Image.asset(
                            Assets.kPlaceholder,
                          ), radius: 20,
                        )
                      ),
                      PositionedDirectional(
                        bottom: 0,
                        end: 5,
                        width: 38.w,
                        height: 38.w,
                        child: Container(
                          width: 38.w,
                          height: 38.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff253F50),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 14.h,
                    bottom: 44.h,
                  ),
                  child: Text(
                   controller.profileModel?.nameEn??'',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                CustomInput(
                  hint: controller.profileModel?.nameEn??LocalKeys.kFullname.tr,
                  textEditingController: controller.firstName,
                  title: LocalKeys.kFullname.tr,
                  suffixIcon: Assets.kProfileIcon,
                ),
                CustomInput(
                  hint: controller.profileModel?.mobile??LocalKeys.kPhoneNumber.tr,
                  textEditingController: controller.phone,
                  title: LocalKeys.kPhoneNumber.tr,
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
                InkWell(
                  onTap: () => Get.toNamed(Routes.RESET_PASSWORD),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      LocalKeys.kReset.tr,
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                ),
                const Spacer(),
                CustomButton(
                  title: LocalKeys.ksave.tr,
                  onPress: () async{
                    UpdateProfileModel? profileModel=await ProfileApis().updateProfileData(
                        name: controller.firstName.text, password:'123456', mobile: controller.phone.text);
                    if(profileModel?.data !=null){
                      Get.back();
                      Get.snackbar('Update Profile', profileModel?.data?.msg??'Profile is updated successfully');
                    }else{
                      Get.back();
                      Get.snackbar('Update Profile', profileModel?.data?.msg??'error occurred');
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
