import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../../../../../../../../app_theme.dart';
import 'drawer_item.dart';

class MainDrawer extends GetView<HomeScreenController> {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 259.h,
            color: primaryColor,
            child: Stack(
              children: [
                SvgPicture.asset(
                  Assets.kDrawer,
                  fit: BoxFit.fitWidth,
                  color: Colors.black.withOpacity(0.07),
                ),
                PositionedDirectional(
                  bottom: 65.h,
                  start: 33.w,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.w,
                        backgroundColor: whiteColor,
                        child: SvgPicture.asset(
                          Assets.kProfileIcon,
                          color: primaryColor,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "User Account",
                          style: Get.textTheme.headline1!
                              .copyWith(color: whiteColor),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 29.w),
              child: Column(
                children: [
                   DrawerItem(
                    name: LocalKeys.kDelivered.tr,
                    icon: Assets.kCheckListIcon,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                    },
                  ),
                  DrawerItem(
                    name: LocalKeys.kAssigned.tr,
                    icon: Assets.kSend,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                      Get.toNamed(Routes.ORDERS);
                    },
                  ),
                  DrawerItem(
                    name: LocalKeys.kProfileSetting.tr,
                    icon: Assets.kProfileIcon,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                      Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 17.5.h),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.kWeb,
                                width: 25.w,
                                height: 25.h,
                                color: primaryColor,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                LocalKeys.kLanguage.tr,
                                style: Get.textTheme.headline3,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: (){
                             // controller.isSelected.value = true;
                              if ((controller.isSelected.value &&
                                  Get.locale!.languageCode == "en") ||
                                  (!controller.isSelected.value &&
                                      Get.locale!.languageCode != "en")) {
                                controller.onChangeLang();

                              }
                            },
                            child: Container(
                              height: 32.h,
                              width: 72.w,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                Get.locale!.languageCode == "en"
                                    ? "English"
                                    : "عربى",
                                style: Get.textTheme.caption!
                                    .copyWith(color: whiteColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  DrawerItem(
                    name: LocalKeys.kSignOut.tr,
                    icon: Assets.kLogOut,
                    onTap: () {
                      controller.scaffoldKey!.currentState!.openEndDrawer();
                      Get.toNamed(Routes.LOGIN);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
