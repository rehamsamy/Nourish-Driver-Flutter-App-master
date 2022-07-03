class ProfileModel {
  ProfileModel({
      this.id, 
      this.nameEn, 
      this.nameAr, 
      this.mobile, 
      this.status, 
      this.deletedAt, 
      this.smsCode, 
      this.image,});

  ProfileModel.fromJson(dynamic json) {
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
  String? smsCode;
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