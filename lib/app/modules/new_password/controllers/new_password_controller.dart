import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
TextEditingController password = TextEditingController();
TextEditingController rePassword = TextEditingController();
Map map=Get.arguments;
 String ? mobile;
int ? otp;

@override
void onInit() {
  // TODO: implement onInit
  super.onInit();
  mobile=map['mobile'];
  otp=map['code'];
}

}
