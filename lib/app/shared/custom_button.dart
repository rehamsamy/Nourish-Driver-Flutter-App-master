import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onPress,
    this.color,
    this.width,
    this.height,
    this.borderRadius,
    this.icon,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  final String title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Function onPress;
  final Color? color;
  final String? icon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 60.h,
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? primaryColor),
        ),
        child: Row(
          mainAxisAlignment: icon != null
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            icon == null
                ? const SizedBox.shrink()
                : SvgPicture.asset(
                    icon!,
                    height: 16.h,
                    width: 16.w,
                    color: Colors.white,
                  ),
            Text(
              " $title",
              style: Theme.of(context).textTheme.button!,
            ),
          ],
        ),
      ),
    );
  }
}
