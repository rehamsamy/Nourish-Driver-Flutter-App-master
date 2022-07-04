import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/models/order_model.dart';
import 'package:nourish_driver/app/data/models/orders_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/order_apis.dart';
import 'package:nourish_driver/routes/app_pages.dart';

import '../../app_theme.dart';

class OrderItem extends StatelessWidget {
  final Data1? ordersData;
  const OrderItem( {Key? key,required this.ordersData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
       OrderModel ? orderModel= await OrderApis().getOrderDetails(4);
       if(orderModel?.data !=null){
         Get.toNamed(Routes.ORDER_DETAILS,arguments: {'orderModel':orderModel});
       }else{
         Get.snackbar('error', orderModel?.data?.error??'Error Occurred');
       }

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
                   ordersData?.order?.user?.nameEn??"",
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
                          ordersData?.order?.user?.mobile??"",
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
                            "${LocalKeys.kLocation.tr}: ${ordersData?.order?.address?.area}",
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
