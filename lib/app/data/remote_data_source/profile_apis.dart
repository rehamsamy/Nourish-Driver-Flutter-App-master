import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/app_constants.dart';
import 'package:nourish_driver/app/data/models/order_model.dart';
import 'package:nourish_driver/app/data/models/profile_model.dart';
import 'package:nourish_driver/app/data/models/rest_password_model.dart';
import 'package:nourish_driver/app/data/models/update_profile_model.dart';
import 'package:nourish_driver/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';

class ProfileApis {

  Future<ProfileModel?> getprofileData() async {
    ProfileModel profileModel = ProfileModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/me',
      data: NetworkRequestBody.json(
        {},
      ),
    );
    NetworkResponse response = await networkService.execute(
      request,
      ProfileModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      profileModel = data;
      return profileModel;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return profileModel;
  }

  Future<UpdateProfileModel?> updateProfileData({required String name,
    required String password,
    required String mobile}) async {
    UpdateProfileModel profileModel = UpdateProfileModel();
    Map<String, dynamic>? map = {
      'name': name,
      'password': password,
      'password_confirmation': password,
      'mobile': mobile
    };

    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/updateProfile',
      data: NetworkRequestBody.json(
        {},
      ),

    );
    NetworkResponse response = await networkService.execute(
      request,
      UpdateProfileModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      profileModel = data;
      return profileModel;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return profileModel;
  }




  Future<RestPasswordModel?> resetPassword({
    required String password,
    required String confirmPassword,
    required String mobile,
    required int code}) async {
    RestPasswordModel passwordModel = RestPasswordModel();
    Map<String, dynamic>? map = {
      'password': password,
      'mobile':mobile,
      'code':code,
      'password_confirmation': confirmPassword,
    };
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'resetPassword',
      data: NetworkRequestBody.json(
        map,
      ),

    );
    NetworkResponse response = await networkService.execute(
      request,
      RestPasswordModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      passwordModel = data;
      return passwordModel;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return passwordModel;
  }


  // Future<LoginModel?> logoutUser() async {
  //   LoginModel? loginModel = LoginModel();
  //   final request = NetworkRequest(
  //     type: NetworkRequestType.POST,
  //     path: 'auth/logout',
  //     data: const NetworkRequestBody.json(
  //       {},
  //     ),
  //   );
  //   NetworkResponse response = await networkService.execute(
  //     request,
  //     LoginModel.fromJson, // <- Function to convert API response to your model
  //   );
  //   response.maybeWhen(ok: (data) async {
  //     print('vvv' + data.toString());
  //     loginModel = data as LoginModel;
  //     Get.find<SharedPrefService>().removeToken();
  //     return loginModel;
  //   }, orElse: () {
  //     print(response.toString());
  //     print("data");
  //   });
  //   return loginModel;
  // }

}