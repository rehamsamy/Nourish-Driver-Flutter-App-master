import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/models/delivery_status_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/delivery_status_api.dart';
import 'package:nourish_driver/app/modules/order_details/controllers/order_details_controller.dart';
import 'package:nourish_driver/app/shared/custom_button.dart';
import 'package:nourish_driver/app/shared/custom_input.dart';

import '../../../../../app_theme.dart';
import 'bordered_container.dart';

class NotDeliveredActionsDialog extends  GetView<OrderDetailsController>  {
  NotDeliveredActionsDialog({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 34.h),
        child: GetBuilder<OrderDetailsController>(
          builder: (_)=> Column(
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
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            onChanged: (value) {
                              controller.setRadioSelected(value);
                            },
                            groupValue: controller.groupValue,
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
                      Divider(
                        color: lightGreyColor,
                        indent: 0,
                        endIndent: 0,
                        height: 1.h,
                        thickness: 1.h,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            onChanged: (value) {
                              controller.setRadioSelected(value);
                            },
                            groupValue: controller.groupValue,
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
                      Divider(
                        color: lightGreyColor,
                        indent: 0,
                        endIndent: 0,
                        height: 1.h,
                        thickness: 1.h,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            onChanged: (value) {
                              Get.log('vvv'+value.toString());
                              controller.setRadioSelected(value);
                            },
                            groupValue: controller.groupValue,
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
                  onPress: () async{
                    String reason =controller.groupValue==0?'no response':
                    controller.groupValue==1?'out of coverage': _controller.text;


                    DeliveryStatusModel ? statusModel=await DeliveryStatusApis().
                    changeDeliveryStatus(orderId: controller.orderModel?.data?.user?.id??0, status: 'not_delivered', reason: reason);
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
