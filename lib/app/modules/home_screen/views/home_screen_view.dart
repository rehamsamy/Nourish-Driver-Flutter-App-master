import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/models/orders_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/orders_apis.dart';
import 'widgets/drawer.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_driver/app/shared/order_item.dart';
import 'widgets/report_problem.dart';
import 'package:nourish_driver/app_theme.dart';
import 'package:nourish_driver/routes/app_pages.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 91.w,
          height: 32.h,
        ),
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            controller.scaffoldKey!.currentState!.openDrawer();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Center(
              child: SvgPicture.asset(
                Assets.kMenuIcon,
                width: 23.w,
                height: 23.h,
              ),
            ),
          ),
        ),
      ),
      drawer: const MainDrawer(),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
              width: Get.width,
              height: 53.h,
              child: ListView.builder(
                itemCount: controller.keys?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Get.log('size is '+(controller.keys?.length.toString()).toString());
                  return Container(
                    decoration: BoxDecoration(
                      color: index == 0 ? primaryColor : whiteColor,
                      border: Border.all(color: blueGreyColor),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    padding: EdgeInsets.symmetric(horizontal: 12.5.w),
                    child: Text(
                      controller.keys?[index]?? "",
                      style: Get.textTheme.headline3!.copyWith(
                        color: index == 1 ? whiteColor : blueGreyColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 33.h, bottom: 35.h),
              width: 374.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.kLocationIcon,
                    width: 78.w,
                    height: 100.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Branch Name Here",
                          style: Get.textTheme.headline1!
                              .copyWith(color: whiteColor),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.kPhoneIcon,
                              width: 14.w,
                              height: 14.h,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              width: Get.width * 0.5,
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
                                  "+96855214755",
                                  style: Get.textTheme.bodyText1!
                                      .copyWith(color: whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 14.h),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.kNavigationPointerIcon,
                                width: 14.w,
                                height: 14.h,
                                color: whiteColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "${LocalKeys.kLocation.tr}: riyadh",
                                        style: Get.textTheme.bodyText1!
                                            .copyWith(color: whiteColor),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      LocalKeys.kMap.tr,
                                      style: Get.textTheme.caption!.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xffF4EC64),
                                        decorationColor:
                                            const Color(0xffF4EC64),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.dialog(ReportProblemDialog());
                          },
                          child: Text(
                            LocalKeys.kReportproblem.tr,
                            style: Get.textTheme.subtitle1,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              whiteColor,
                            ),
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
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        LocalKeys.kAssignedOrders.tr,
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    Expanded(
                      child:ListView.builder(
                                 itemCount: controller.ordersList?.length,
                                  itemBuilder: (context, index) {
                                    return  OrderItem( ordersData: controller.ordersList?[index]);
                                  },
                                )
                      // child: FutureBuilder(
                      //   future: OrdersApis().getAllOrders(),
                      //   builder: (_,snapshot){
                      //     if(snapshot.hasData){
                      //       List<Data1>? ordersList=snapshot.data as List<Data1>?  ;
                      //       if(ordersList!.isNotEmpty){
                      //        return ListView.builder(
                      //          itemCount: ordersList.length,
                      //           itemBuilder: (context, index) {
                      //             return  OrderItem( ordersData: ordersList[index]);
                      //           },
                      //         );
                      //       }else{
                      //
                      //         return const SizedBox(
                      //           child: Center(child: Text('no orders found'),),
                      //         );
                      //       }
                      //     }else{
                      //       print('vvv3' + snapshot.toString());
                      //       return  const SizedBox();
                      //
                      //     }
                      //   },
                      //
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
