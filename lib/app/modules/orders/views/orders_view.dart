import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/assets.dart';
import 'package:nourish_driver/app/core/values/localization/local_keys.dart';
import 'package:nourish_driver/app/data/models/orders_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/orders_apis.dart';
import 'package:nourish_driver/app/shared/order_item.dart';
import 'package:nourish_driver/app/shared/tab_bar_selector.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          Assets.kLogo,
          width: 91.w,
          height: 32.h,
        ),
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 35.h),
          child: Obx(
            () => Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    LocalKeys.kOrders.tr,
                    style: Get.textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: TabBarSelector(
                    firstTitle: LocalKeys.kDelivered.tr,
                    secondTitle: "${LocalKeys.kNotDelivered.tr} (12)",
                    selected: controller.selected.value,
                    onTap: (value) {
                      controller.selected.value = value;
                    },
                  ),
                ),
                Expanded(
                child:
                FutureBuilder(
                    future: OrdersApis().getAllOrders(type:controller.selected.value==0?'delivered':'not_delivered'),
                    builder: (_,snapshot){
                      if(snapshot.hasData){
                        List<Data1>? ordersList=snapshot.data as List<Data1>?  ;
                        if(ordersList!.isNotEmpty){
                          return ListView.builder(
                            itemCount: ordersList.length,
                            itemBuilder: (context, index) {
                              return  OrderItem( ordersData: ordersList[index]);
                            },
                          );
                        }else{

                          return const SizedBox(
                            child: Center(child: Text('no orders found'),),
                          );
                        }
                      }else{
                        print('vvv3' + snapshot.toString());
                        return  const SizedBox();

                      }
                    },

                  ),
                  // child: ListView.builder(
                  //   itemCount: 7,
                  //   itemBuilder: (context, index) {
                  //     return  OrderItem();
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
