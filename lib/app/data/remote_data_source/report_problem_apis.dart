import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/app_constants.dart';
import 'package:nourish_driver/app/data/models/report_problem_model.dart';
import 'package:nourish_driver/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';

class ReportProblemApis{

  Future<ReportProblemModel?> reportProblem(String desc) async {
    ReportProblemModel reportProblemModel = ReportProblemModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'reportProblem',
      data: NetworkRequestBody.json(
        {"problem": desc,},
      ),
        headers: {
          'Authorization':
          'Bearer $token'
        }
    );
    NetworkResponse response = await networkService.execute(
      request,
      ReportProblemModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      print('vvv' + data.toString());
      reportProblemModel = data;
      return data;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return reportProblemModel;
  }
}