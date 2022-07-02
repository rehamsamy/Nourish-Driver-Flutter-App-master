import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/custom_input.dart';

import '../../../../../app_theme.dart';
import 'bordered_container.dart';

class NotDeliveredActionsDialog extends StatelessWidget {
  NotDeliveredActionsDialog({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 34.h),
        child: Column(
          children: [
            Text(
              LocalKeys.kNotDeliveredActions.tr,
              style: Get.textTheme.headline1,
            ),
            Divider(),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 11.h,
              ),
              child: BorderedContainer(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.1.h, bottom: 14.5.h),
                      child: Row(
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.h,
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primaryColor,
                                )),
                            child: const CircleAvatar(
                              backgroundColor: primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Text(
                            LocalKeys.kNoResponse.tr,
                            style: Get.textTheme.headline3,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15.5.h,
                      ),
                      child: Divider(
                        color: lightGreyColor,
                        indent: 0,
                        endIndent: 0,
                        height: 1.h,
                        thickness: 1.h,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 16.w,
                          height: 16.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primaryColor,
                              )),
                          child: const CircleAvatar(
                            backgroundColor: whiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Text(
                          LocalKeys.kOutOfCoverage.tr,
                          style: Get.textTheme.headline3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 17.5.h,
                        bottom: 15.5.h,
                      ),
                      child: Divider(
                        color: lightGreyColor,
                        indent: 0,
                        endIndent: 0,
                        height: 1.h,
                        thickness: 1.h,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 16.w,
                          height: 16.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primaryColor,
                              )),
                          child: const CircleAvatar(
                            backgroundColor: whiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Text(
                          LocalKeys.kOther.tr,
                          style: Get.textTheme.headline3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: CustomInput(
                hint: LocalKeys.kOther.tr,
                textEditingController: _controller,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: CustomButton(
                title: LocalKeys.ksave.tr,
                onPress: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
