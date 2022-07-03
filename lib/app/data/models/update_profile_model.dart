class UpdateProfileModel {
  UpdateProfileModel({
      this.data,});

  UpdateProfileModel.fromJson(dynamic json) {
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
    msg = json['errors'];
  }
  String? msg;
  String?errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    map['errors'] = errors;
    return map;
  }

}