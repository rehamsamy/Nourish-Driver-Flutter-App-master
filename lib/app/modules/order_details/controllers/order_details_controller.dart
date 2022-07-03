import 'package:get/get.dart';
import 'package:nourish_driver/app/data/models/order_model.dart';

class OrderDetailsController extends GetxController {
  //TODO: Implement OrderDetailsController
  Map map=Get.arguments;
  OrderModel ? orderModel;

  final count = 0.obs;
  @override
  void onInit() {
     orderModel=map['orderModel'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
