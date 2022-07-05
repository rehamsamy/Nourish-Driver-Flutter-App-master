import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  TextEditingController otp = TextEditingController();
  Map map=Get.arguments;
  late String mobile;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mobile=map['mobile'];
  }
}
