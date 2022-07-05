import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/data/models/orders_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/orders_apis.dart';
import 'package:nourish_driver/app/data/services/localization_service.dart';

class HomeScreenController extends GetxController {
GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
OrdersModel ? ordersModel=OrdersModel();
List<Data1>? _ordersList;
List<String>?_keys=[];
int index=0;

RxBool isSelected =
Get.find<LocalizationService>().isAr() ? true.obs : false.obs;



@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
 getOrdersList();
  }


  changeIndexKeysListView(int value){
  index=value;
  update();
  }




List<String>? get keys {
  return _keys;
}

List<Data1>? get ordersList {
  return _ordersList;
}


getOrdersList()async{
  ordersModel= await OrdersApis().getOrders();
  if(ordersModel?.data !=null){
    _ordersList=ordersModel?.data?.orders?.data?[index];
    _keys=ordersModel?.data?.orders?.keys;
    Get.log('222222222222 '+(ordersModel?.data?.orders?.keys?[0].toString()).toString());
    update();

  }else{
    return;
  }
}


onChangeLang() {
  Get.find<LocalizationService>()
      .setLocale(!Get.find<LocalizationService>().isAr() ? "ar" : "en");
  update();
}

}
