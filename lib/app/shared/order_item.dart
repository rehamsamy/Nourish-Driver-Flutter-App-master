import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../../app_theme.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ORDER_DETAILS);
      },
      child: Container(
        width: 366.w,
        margin: EdgeInsets.symmetric(vertical: 11.h),
        decoration: BoxDecoration(
          border: Border.all(color: lightGreyColor),
          borderRadius: BorderRadius.circular(6.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Assets.kBagIcon,
              width: 64.w,
              height: 72.h,
            ),
            SizedBox(
              width: 30.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: Get.width*0.55,
                  child: Text(
                    "Client Name",
                    style: Get.textTheme.bodyText2,
                  ),
                ),
                SizedBox(width: Get.width*0.55,
                  child: Text(
                    "Subs. No",
                    style: Get.textTheme.caption!.copyWith(color: blueGreyColor),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                SizedBox(width: Get.width*0.55,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.kPhoneIcon,
                        width: 14.w,
                        height: 14.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                        child: Text(
                          "+96855214755",
                          style:
                              Get.textTheme.caption!.copyWith(color: blueGreyColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Get.width*0.55,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.kNavigationPointerIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                          child: Text(
                            "${LocalKeys.kLocation.tr}: riyadh",
                            style: Get.textTheme.caption!
                                .copyWith(color: blueGreyColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
