import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';


class ReportProblemDialog extends StatelessWidget {
  ReportProblemDialog({Key? key}) : super(key: key);
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
              LocalKeys.kReportproblem.tr,
              style: Get.textTheme.headline1,
            ),
            const Divider(),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: TextFormField(
                maxLines: 6,
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                  hintText: LocalKeys.kDescription.tr,
                ),
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
