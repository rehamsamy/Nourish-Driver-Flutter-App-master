import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/app_constants.dart';
import 'package:nourish_driver/app/data/models/delivery_status_model.dart';
import 'package:nourish_driver/app/data/models/order_model.dart';
import 'package:nourish_driver/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';

class DeliveryStatusApis{

  Future<DeliveryStatusModel?> changeDeliveryStatus({required int orderId,required String status,required String reason}) async {
    DeliveryStatusModel statusModel = DeliveryStatusModel();
    Map<String,dynamic> ?map={
      'order_id':orderId,
      'status':status,
      'reason':reason
    };
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'orders/deliveryStatus',
        data: NetworkRequestBody.json(
          map,
        ),
        headers: {
          'Authorization':
          'Bearer $token'
        }
    );
    NetworkResponse response = await networkService.execute(
      request,
      DeliveryStatusModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      print('vvv' + data.toString());
      statusModel = data;
      return data;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return statusModel;
  }
}