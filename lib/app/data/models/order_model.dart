class OrderModel {
  OrderModel({
      this.data,});

  OrderModel.fromJson(dynamic json) {
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
      this.id, 
      this.userId, 
      this.addressId, 
      this.user, 
      this.address,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    error = json['error'];
  }
  int? id;
  int? userId;
  int? addressId;
  User? user;
  Address? address;
  String ?error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['address_id'] = addressId;
    map['error'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }

}

class Address {
  Address({
      this.id, 
      this.userId, 
      this.lat, 
      this.lng, 
      this.name, 
      this.addressType, 
      this.area, 
      this.building, 
      this.flat, 
      this.street, 
      this.postalCode, 
      this.additionalNumber, 
      this.deliveryInstructions,});

  Address.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    addressType = json['address_type'];
    area = json['area'];
    building = json['building'];
    flat = json['flat'];
    street = json['street'];
    postalCode = json['postal_code'];
    additionalNumber = json['additional_number'];
    deliveryInstructions = json['delivery_instructions'];
  }
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
  dynamic deliveryInstructions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['address_type'] = addressType;
    map['area'] = area;
    map['building'] = building;
    map['flat'] = flat;
    map['street'] = street;
    map['postal_code'] = postalCode;
    map['additional_number'] = additionalNumber;
    map['delivery_instructions'] = deliveryInstructions;
    return map;
  }

}

class User {
  User({
      this.nameEn, 
      this.id, 
      this.mobile,});

  User.fromJson(dynamic json) {
    nameEn = json['name_en'];
    id = json['id'];
    mobile = json['mobile'];
  }
  String? nameEn;
  int? id;
  String? mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name_en'] = nameEn;
    map['id'] = id;
    map['mobile'] = mobile;
    return map;
  }

}