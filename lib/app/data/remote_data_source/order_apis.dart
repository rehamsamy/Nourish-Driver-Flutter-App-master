import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/app_constants.dart';
import 'package:nourish_driver/app/data/models/order_model.dart';
import 'package:nourish_driver/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';

class OrderApis{

  Future<OrderModel?> getOrderDetails(int orderId) async {
    OrderModel orderModel = OrderModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    Get.log('cccccc  '+token.toString());
    final request = NetworkRequest(
        type: NetworkRequestType.GET,
        path: 'orders/$orderId',
        data: NetworkRequestBody.json(
          {},
        ),
    );
    NetworkResponse response = await networkService.execute(
      request,
      OrderModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      print('vvv' + data.toString());
      orderModel = data;
      return data;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return orderModel;
  }
}