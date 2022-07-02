import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';

class TabBarSelector extends StatelessWidget {
  const TabBarSelector(
      {required this.firstTitle,
      required this.secondTitle,
      required this.selected,
      required this.onTap,
      Key? key})
      : super(key: key);
  final String firstTitle;
  final String secondTitle;
  final int selected;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 53.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(0);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected == 0 ? primaryColor : moreLightGreyColor,
                  border: Border.all(
                    color: selected == 0 ? primaryColor : lightGreyColor,
                  ),
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(8.r),
                    topStart: Radius.circular(8.r),
                  ),
                ),
                child: Text(
                  firstTitle,textAlign: TextAlign.center,
                  style: selected == 0
                      ? Get.textTheme.button
                      : Get.textTheme.headline2,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(1);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected == 1 ? primaryColor : moreLightGreyColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(8.r),
                    topEnd: Radius.circular(8.r),
                  ),
                  border: Border.all(
                    color: selected == 1 ? primaryColor : lightGreyColor,
                  ),
                ),
                child: Text(
                  secondTitle,textAlign: TextAlign.center,
                  style: selected == 1
                      ? Get.textTheme.button
                      : Get.textTheme.headline2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
