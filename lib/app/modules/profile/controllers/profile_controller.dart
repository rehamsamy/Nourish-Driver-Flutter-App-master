import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_driver/app/data/models/profile_model.dart';
import 'package:nourish_driver/app/data/remote_data_source/profile_apis.dart';

class ProfileController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController otp = TextEditingController();
  ProfileModel ?profileModel;


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    profileModel=await ProfileApis().getprofileData();
    if(profileModel?.id !=null){
     Get.snackbar('Profile Data', 'get data successfully');
     phone.text=profileModel?.mobile??'';
     firstName.text=profileModel?.nameEn??'';
     phone.text=profileModel?.mobile??'';
    }else{
      Get.back();
      Get.snackbar('Profile Data', 'Error Occured');
    }

  }
}
