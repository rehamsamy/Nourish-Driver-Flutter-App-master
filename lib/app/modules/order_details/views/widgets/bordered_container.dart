import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../../../../../app_theme.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({required this.child, Key? key})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374.w,
      padding: EdgeInsets.symmetric(vertical: 14.5.h, horizontal: 21.w),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        border: Border.all(color: lightGreyColor),
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      child: child,
    );
  }
}