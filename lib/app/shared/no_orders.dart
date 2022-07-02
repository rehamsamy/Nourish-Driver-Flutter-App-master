import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';

import 'custom_button.dart';
import 'no_results.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NoResults(
        text: LocalKeys.kNoOrderYet.tr,
        image: Assets.kPackage,
        height: 123.h,
        width: 129.w,
        anotherWidget: Padding(
          padding: EdgeInsets.only(top: 48.5.w),
          child: SizedBox(
            width: 250.w,
            child: CustomButton(
              title: "Home Page",
              onPress: () {},
            ),
          ),
        ),
      ),
    );
  }
}
