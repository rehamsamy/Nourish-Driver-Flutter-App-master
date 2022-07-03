class ForgetPasswordModel {
  ForgetPasswordModel({
      this.data,});

  ForgetPasswordModel.fromJson(dynamic json) {
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
      this.mobile, 
      this.msg,});

  Data.fromJson(dynamic json) {
    mobile = json['mobile'];
    msg = json['msg'];
    error=json['error'];
  }
  String? mobile;
  String? msg;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['msg'] = msg;
    map['error'] = error;
    return map;
  }

}