class OrdersModel {
  Data? data;

  OrdersModel({this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.data != null)
      data["data"] = this.data?.toJson();
    return data;
  }
}

class Data {
  Orders? orders;
  int? deliveredCount;
  int? notDeliveredCount;

  Data({this.orders, this.deliveredCount, this.notDeliveredCount});

  Data.fromJson(Map<String, dynamic> json) {
    this.orders = json["orders"] == null ? null : Orders.fromJson(json["orders"]);
    this.deliveredCount = json["delivered_count"];
    this.notDeliveredCount = json["not_delivered_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.orders != null)
      data["orders"] = this.orders?.toJson();
    data["delivered_count"] = this.deliveredCount;
    data["not_delivered_count"] = this.notDeliveredCount;
    return data;
  }
}

class Orders {
  List<String>? keys;
  List<List<Data1>>? data;

  Orders({this.keys, this.data});

  Orders.fromJson(Map<String, dynamic> json) {
    this.keys = json["keys"]==null ? null : List<String>.from(json["keys"]);
    this.data = (json["data"]==null ? null : (json["data"] as List).
    map((e)=>e==null?[]:(e as List).map((e)=>Data1.fromJson(e)).toList()).toList())?.cast<List<Data1>>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.keys != null)
      data["keys"] = this.keys;
    if(this.data != null)
      data["data"] = this.data?.map((e)=>e.map((e)=>e.toJson()).toList() ?? []).toList();
    return data;
  }
}

class Data1 {
  int? id;
  int? driverId;
  int? orderId;
  String? driverName;
  Order? order;

  Data1({this.id, this.driverId, this.orderId, this.driverName, this.order});

  Data1.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.driverId = json["driver_id"];
    this.orderId = json["order_id"];
    this.driverName = json["driver_name"];
    this.order = json["order"] == null ? null : Order.fromJson(json["order"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["driver_id"] = this.driverId;
    data["order_id"] = this.orderId;
    data["driver_name"] = this.driverName;
    if(this.order != null)
      data["order"] = this.order?.toJson();
    return data;
  }
}

class Order {
  int? id;
  String? quantity;
  String? startDate;
  String? endDate;
  dynamic? pausedAt;
  int? pauseCount;
  dynamic? driverNote;
  String? status;
  dynamic? resumeAt;
  String? deliveryType;
  int? branchId;
  int? userId;
  int? addressId;
  int? driverId;
  int? packageId;
  int? periodId;
  String? requested;
  String? totalWithoutVat;
  String? discountValue;
  String? totalWithVat;
  String? vat;
  int? paymentId;
  dynamic? discountId;
  String? delivery;
  dynamic? generatedCodeTlv;
  Address? address;
  User? user;
  Period? period;

  Order({this.id, this.quantity, this.startDate, this.endDate, this.pausedAt, this.pauseCount, this.driverNote, this.status, this.resumeAt, this.deliveryType, this.branchId, this.userId, this.addressId, this.driverId, this.packageId, this.periodId, this.requested, this.totalWithoutVat, this.discountValue, this.totalWithVat, this.vat, this.paymentId, this.discountId, this.delivery, this.generatedCodeTlv, this.address, this.user, this.period});

  Order.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.quantity = json["quantity"];
    this.startDate = json["start_date"];
    this.endDate = json["end_date"];
    this.pausedAt = json["paused_at"];
    this.pauseCount = json["pause_count"];
    this.driverNote = json["driver_note"];
    this.status = json["status"];
    this.resumeAt = json["resume_at"];
    this.deliveryType = json["delivery_type"];
    this.branchId = json["branch_id"];
    this.userId = json["user_id"];
    this.addressId = json["address_id"];
    this.driverId = json["driver_id"];
    this.packageId = json["package_id"];
    this.periodId = json["period_id"];
    this.requested = json["requested"];
    this.totalWithoutVat = json["total_without_vat"];
    this.discountValue = json["discount_value"];
    this.totalWithVat = json["total_with_vat"];
    this.vat = json["vat"];
    this.paymentId = json["payment_id"];
    this.discountId = json["discount_id"];
    this.delivery = json["delivery"];
    this.generatedCodeTlv = json["generated_code_TLV"];
    this.address = json["address"] == null ? null : Address.fromJson(json["address"]);
    this.user = json["user"] == null ? null : User.fromJson(json["user"]);
    this.period = json["period"] == null ? null : Period.fromJson(json["period"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["quantity"] = this.quantity;
    data["start_date"] = this.startDate;
    data["end_date"] = this.endDate;
    data["paused_at"] = this.pausedAt;
    data["pause_count"] = this.pauseCount;
    data["driver_note"] = this.driverNote;
    data["status"] = this.status;
    data["resume_at"] = this.resumeAt;
    data["delivery_type"] = this.deliveryType;
    data["branch_id"] = this.branchId;
    data["user_id"] = this.userId;
    data["address_id"] = this.addressId;
    data["driver_id"] = this.driverId;
    data["package_id"] = this.packageId;
    data["period_id"] = this.periodId;
    data["requested"] = this.requested;
    data["total_without_vat"] = this.totalWithoutVat;
    data["discount_value"] = this.discountValue;
    data["total_with_vat"] = this.totalWithVat;
    data["vat"] = this.vat;
    data["payment_id"] = this.paymentId;
    data["discount_id"] = this.discountId;
    data["delivery"] = this.delivery;
    data["generated_code_TLV"] = this.generatedCodeTlv;
    if(this.address != null)
      data["address"] = this.address?.toJson();
    if(this.user != null)
      data["user"] = this.user?.toJson();
    if(this.period != null)
      data["period"] = this.period?.toJson();
    return data;
  }
}

class Period {
  int? id;
  String? from;
  String? to;
  String? fromDescriptionEn;
  String? fromDescriptionAr;
  String? toDescriptionEn;
  String? toDescriptionAr;
  String? name;

  Period({this.id, this.from, this.to, this.fromDescriptionEn, this.fromDescriptionAr, this.toDescriptionEn, this.toDescriptionAr, this.name});

  Period.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.from = json["from"];
    this.to = json["to"];
    this.fromDescriptionEn = json["from_description_en"];
    this.fromDescriptionAr = json["from_description_ar"];
    this.toDescriptionEn = json["to_description_en"];
    this.toDescriptionAr = json["to_description_ar"];
    this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["from"] = this.from;
    data["to"] = this.to;
    data["from_description_en"] = this.fromDescriptionEn;
    data["from_description_ar"] = this.fromDescriptionAr;
    data["to_description_en"] = this.toDescriptionEn;
    data["to_description_ar"] = this.toDescriptionAr;
    data["name"] = this.name;
    return data;
  }
}

class User {
  int? id;
  String? nameEn;
  String? email;
  String? emailVerifiedAt;
  dynamic? rememberToken;
  String? type;
  String? nameAr;
  dynamic? image;
  int? status;
  String? mobile;
  String? smsCode;
  dynamic? emailVerifyCode;
  int? verified;
  dynamic? locale;
  dynamic? deviceToken;

  User({this.id, this.nameEn, this.email, this.emailVerifiedAt, this.rememberToken, this.type, this.nameAr, this.image, this.status, this.mobile, this.smsCode, this.emailVerifyCode, this.verified, this.locale, this.deviceToken});

  User.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.nameEn = json["name_en"];
    this.email = json["email"];
    this.emailVerifiedAt = json["email_verified_at"];
    this.rememberToken = json["remember_token"];
    this.type = json["type"];
    this.nameAr = json["name_ar"];
    this.image = json["image"];
    this.status = json["status"];
    this.mobile = json["mobile"];
    this.smsCode = json["sms_code"];
    this.emailVerifyCode = json["email_verify_code"];
    this.verified = json["verified"];
    this.locale = json["locale"];
    this.deviceToken = json["device_token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name_en"] = this.nameEn;
    data["email"] = this.email;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["remember_token"] = this.rememberToken;
    data["type"] = this.type;
    data["name_ar"] = this.nameAr;
    data["image"] = this.image;
    data["status"] = this.status;
    data["mobile"] = this.mobile;
    data["sms_code"] = this.smsCode;
    data["email_verify_code"] = this.emailVerifyCode;
    data["verified"] = this.verified;
    data["locale"] = this.locale;
    data["device_token"] = this.deviceToken;
    return data;
  }
}

class Address {
  int? id;
  int? userId;
  String? lat;
  String? lng;
  String? name;
  String? addressType;
  String? area;
  String? building;
  String? flat;
  String? street;
  String? postalCode;
  String? additionalNumber;
  dynamic? deliveryInstructions;

  Address({this.id, this.userId, this.lat, this.lng, this.name, this.addressType, this.area, this.building, this.flat, this.street, this.postalCode, this.additionalNumber, this.deliveryInstructions});

  Address.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.userId = json["user_id"];
    this.lat = json["lat"];
    this.lng = json["lng"];
    this.name = json["name"];
    this.addressType = json["address_type"];
    this.area = json["area"];
    this.building = json["building"];
    this.flat = json["flat"];
    this.street = json["street"];
    this.postalCode = json["postal_code"];
    this.additionalNumber = json["additional_number"];
    this.deliveryInstructions = json["delivery_instructions"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["lat"] = this.lat;
    data["lng"] = this.lng;
    data["name"] = this.name;
    data["address_type"] = this.addressType;
    data["area"] = this.area;
    data["building"] = this.building;
    data["flat"] = this.flat;
    data["street"] = this.street;
    data["postal_code"] = this.postalCode;
    data["additional_number"] = this.additionalNumber;
    data["delivery_instructions"] = this.deliveryInstructions;
    return data;
  }
}