import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/models/delivery_status_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/delivery_status_api.dart';
import 'widgets/bordered_container.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'widgets/not_delivered_actions_dialog.dart';

import '../../../../app_theme.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 91.w,
          height: 32.h,
        ),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 55.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.kBagIcon,
                width: 88.w,
                height: 99.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 2.h),
                child: Text(
                 controller.orderModel?.data?.user?.nameEn??'',
                  style: Get.textTheme.bodyText2,
                ),
              ),
              Text(
                "Subs. No",
                style: Get.textTheme.caption!.copyWith(color: blueGreyColor),
              ),
              Container(
                width: 354.w,
                height: 47.h,
                margin: EdgeInsets.only(top: 35.h, bottom: 6.5.h),
                decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: blueGreyColor),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.kPhoneIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: Get.width * 0.55,
                          child: InkWell(
                            onTap: () {
                              Clipboard.setData(
                                const ClipboardData(text: "96855214755"),
                              );
                              BotToast.showText(
                                text: LocalKeys.kCopiedClipboard.tr,
                              );
                            },
                            child: Text(
                              controller.orderModel?.data?.user?.mobile??"",
                              style: Get.textTheme.caption!
                                  .copyWith(color: blueGreyColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      Assets.kPhoneIcon,
                      width: 31.w,
                      height: 31.h,
                      color: const Color(0xff2BB07B),
                    ),
                  ],
                ),
              ),
              Container(
                width: 354.w,
                height: 47.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: blueGreyColor),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.kNavigationPointerIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: Get.width * 0.55,
                          child: Text(
                            "${LocalKeys.kLocation.tr}:${controller.orderModel?.data?.address?.area??""}",
                            style: Get.textTheme.caption!
                                .copyWith(color: blueGreyColor),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      LocalKeys.kViewMap.tr,
                      style: Get.textTheme.caption!.copyWith(
                          decoration: TextDecoration.underline,
                          color: const Color(0xff4676DA)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 37.w,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 31.h, bottom: 6.h),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          LocalKeys.kActionForOrder.tr,
                          style: Get.textTheme.headline3!.copyWith(
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                    BorderedContainer(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 1.1.h,
                            ),
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
                                  LocalKeys.kDelivered.tr,
                                  style: Get.textTheme.headline3,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 14.5.h,
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
                          InkWell(
                            onTap: () {
                              Get.dialog(NotDeliveredActionsDialog());
                            },
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
                                    backgroundColor: whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                Text(
                                  LocalKeys.kNotDelivered.tr,
                                  style: Get.textTheme.headline3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 37.w,
                ),
                child: CustomButton(
                  title: LocalKeys.ksave.tr,
                  onPress: ()async {
                    DeliveryStatusModel ? statusModel=await DeliveryStatusApis().changeDeliveryStatus(orderId: controller.orderModel?.data?.user?.id??0,
                        status: 'delivered', reason:'delivered');
                    if(statusModel?.data !=null){
                      Get.back();
                      Get.snackbar('Change Order Status', statusModel?.data?.msg??'Sucess');
                    }else{
                      Get.back();
                      Get.snackbar('Change Order Status', statusModel?.data?.error??'Error occurred');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}