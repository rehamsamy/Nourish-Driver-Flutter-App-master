class LoginModel {
  LoginModel({
      this.accessToken, 
      this.tokenType, 
      this.user, 
      this.expiresIn,});

  LoginModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    expiresIn = json['expires_in'];
    error=json['error'];
  }
  String? accessToken;
  String? tokenType;
  User? user;
  int? expiresIn;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['error']=error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['expires_in'] = expiresIn;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.nameEn, 
      this.nameAr, 
      this.mobile, 
      this.status, 
      this.deletedAt, 
      this.smsCode, 
      this.image,});

  User.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    mobile = json['mobile'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    smsCode = json['sms_code'];
    image = json['image'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  String? mobile;
  int? status;
  dynamic deletedAt;
  dynamic smsCode;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['mobile'] = mobile;
    map['status'] = status;
    map['deleted_at'] = deletedAt;
    map['sms_code'] = smsCode;
    map['image'] = image;
    return map;
  }

}