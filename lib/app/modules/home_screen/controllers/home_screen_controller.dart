import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/data/models/orders_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/orders_apis.dart';

class HomeScreenController extends GetxController {
GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
OrdersModel ? ordersModel;
List<Data1>? ordersList;
List<String>?_keys;
@override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
   ordersModel= await OrdersApis().getOrders();
   if(ordersModel?.data !=null){
      ordersList=ordersModel?.data?.orders?.data?[0];
      _keys=ordersModel?.data?.orders?.keys;
      update();
      Get.log('size is 2'+(_keys?.length.toString()).toString());
   }else{
     return;
   }
  }

List<String>? get keys => _keys;
}
