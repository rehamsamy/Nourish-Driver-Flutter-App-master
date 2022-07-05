class RestPasswordModel {
  RestPasswordModel({
    this.data,});

  RestPasswordModel.fromJson(dynamic json) {
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
    message = json['message'];
  }
  String? msg;
  String ?error;
  String?message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    map['error'] = error;
    map['message'] = message;
    return map;
  }

}