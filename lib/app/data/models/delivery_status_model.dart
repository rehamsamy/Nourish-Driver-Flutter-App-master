class DeliveryStatusModel {
  DeliveryStatusModel({
      this.data,});

  DeliveryStatusModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.msg,});

  Data.fromJson(dynamic json) {
    msg = json['msg'];
    error = json['error'];
  }
  String? msg;
  String?error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    map['error'] = error;
    return map;
  }

}