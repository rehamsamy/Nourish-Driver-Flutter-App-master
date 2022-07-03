import 'package:nourish_driver/app/core/values/app_constants.dart';
import 'package:nourish_driver/app/data/models/forget_password_model.dart';
import 'package:nourish_driver/app/data/models/login_model.dart';
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
      headers: null

    );
    NetworkResponse response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data)async {
      print('vvv' + data.toString());
      loginModel = data;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      SharedPrefService(prefs: prefs)
          .saveToken(loginModel.accessToken ?? '');
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

//   Future<VerifyEmailModel> verifyOtpMobile(String mobile, String otp) async {
//     VerifyEmailModel verifyModel = VerifyEmailModel();
//     Map<String, dynamic>? map = {'mobile': mobile, 'code': otp};
//     final request = NetworkRequest(
//       type: NetworkRequestType.POST,
//       path: 'auth/verifyMobileOTP',
//       data: NetworkRequestBody.json(map),
//     );
//     // Execute a request and convert response to your model:
//     final response = await networkService.execute(
//       request,
//       VerifyEmailModel
//           .fromJson, // <- Function to convert API response to your model
//     );
//
//     response.maybeWhen(
//         ok: (authResponse) async {
//           verifyModel = authResponse as VerifyEmailModel;
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           prefs.clear();
//           Get.log('vvvvv   1'+prefs.getString('token').toString());
//           prefs.setString('token', verifyModel.accessToken ?? '');
//           Get.log('vvvvv   2'+prefs.getString('token').toString());
//           SharedPrefService(prefs: prefs)
//               .saveToken(verifyModel.accessToken ?? '');
//           return verifyModel;
//         },
//         badRequest: (info) {},
//         orElse: () {},
//         invalidParameters: (x) => Get.log('error  + ' + x));
//     return verifyModel;
//   }
 }