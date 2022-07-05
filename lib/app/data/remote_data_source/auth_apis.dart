import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/app_constants.dart';
import 'package:nourish_driver/app/data/models/check_rest_code_model.dart';
import 'package:nourish_driver/app/data/models/forget_password_model.dart';
import 'package:nourish_driver/app/data/models/login_model.dart';
import 'package:nourish_driver/app/data/models/rest_password_model.dart';
import 'package:nourish_driver/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApis {
  Future<LoginModel?> loginUser(String mobile,String password) async {
    LoginModel loginModel = LoginModel();
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/login',
      data: NetworkRequestBody.json(
        {"mobile": mobile,
        'password':password,},
      ),
    );
    NetworkResponse response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data)async {
      print('vvv' + data.toString());
      loginModel = data;
      Get.find<SharedPrefService>().saveToken(loginModel.accessToken??'') ;
      final String? token = Get.find<SharedPrefService>().getToken() ?? '';
      Get.log('token is '+token.toString());
      return data;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return loginModel;
  }


  Future<ForgetPasswordModel?> forgetPassword(String mobile) async {
    ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'forgetPassword',
      data: NetworkRequestBody.json(
        {"mobile": mobile,},
      ),
    );
    NetworkResponse response = await networkService.execute(
      request,
      ForgetPasswordModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      print('vvv' + data.toString());
      forgetPasswordModel = data;
      return data;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return forgetPasswordModel;
  }

  Future<CheckRestCodeModel> checkRestOtpCode(String mobile, int otp) async {
    CheckRestCodeModel verifyModel = CheckRestCodeModel();
    Map<String, dynamic>? map = {'mobile': mobile, 'code': otp};
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'checkResetCode',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      CheckRestCodeModel
          .fromJson, // <- Function to convert API response to your model
    );

    response.maybeWhen(
        ok: (authResponse) async {
         verifyModel=authResponse;
          return verifyModel;
        },
        badRequest: (info) {},
        orElse: () {},
        invalidParameters: (x) => Get.log('error  + ' + x));
    return verifyModel;
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

}