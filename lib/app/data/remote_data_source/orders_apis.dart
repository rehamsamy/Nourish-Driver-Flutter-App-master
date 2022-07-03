import 'package:get/get.dart';
import 'package:nourish_driver/app/core/values/app_constants.dart';
import 'package:nourish_driver/app/data/models/order_model.dart';
import 'package:nourish_driver/app/data/models/orders_model.dart';
import 'package:nourish_driver/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_driver/app/data/services/shared_pref.dart';

class OrdersApis{

  Future<List<Data1>?> getAllOrders({String? type}) async {
    List<Data1> ?ordersList ;
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    String path=type==null?'orders':type=='not_delivered'?
        'orders/?status=$type':'orders?status=$type';
    final request = NetworkRequest(
        type: NetworkRequestType.GET,
        path: path,
        data: NetworkRequestBody.json(
          {},
        ),
    );
    NetworkResponse response = await networkService.execute(
      request,
      OrdersModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
    OrdersModel  ordersModel = data;
    ordersList=ordersModel.data?.orders?.data?[0];
      print('vvv' + ordersList.toString());
      return data;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return ordersList;
  }
}

