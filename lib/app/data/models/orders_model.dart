class OrdersModel {
  OrdersModel({
      this.data,});

  OrdersModel.fromJson(dynamic json) {
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
      this.orders, 
      this.deliveredCount, 
      this.notDeliveredCount,});

  Data.fromJson(dynamic json) {
    orders = json['orders'] != null ? Orders.fromJson(json['orders']) : null;
    deliveredCount = json['delivered_count'];
    notDeliveredCount = json['not_delivered_count'];
  }
  Orders? orders;
  int? deliveredCount;
  int? notDeliveredCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['orders'] = orders?.toJson();
    }
    map['delivered_count'] = deliveredCount;
    map['not_delivered_count'] = notDeliveredCount;
    return map;
  }

}

class Orders {
  Orders({
      this.ordersData,});

  Orders.fromJson(dynamic json) {
    if (json['7 صباحاً - 4 مساءً'] != null) {
      ordersData = [];
      json['7 صباحاً - 4 مساءً'].forEach((v) {
        ordersData?.add(OrdersData.fromJson(v));
      });
    }
  }
  List<OrdersData>? ordersData;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ordersData != null) {
      map['7 صباحاً - 4 مساءً'] = ordersData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrdersData {
  OrdersData({
      this.id, 
      this.driverId, 
      this.orderId, 
      this.driverName, 
      this.order,});

  OrdersData.fromJson(dynamic json) {
    id = json['id'];
    driverId = json['driver_id'];
    orderId = json['order_id'];
    driverName = json['driver_name'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  int? id;
  int? driverId;
  int? orderId;
  String? driverName;
  Order? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['driver_id'] = driverId;
    map['order_id'] = orderId;
    map['driver_name'] = driverName;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    return map;
  }

}

class Order {
  Order({
      this.id, 
      this.quantity, 
      this.startDate, 
      this.endDate, 
      this.pausedAt, 
      this.pauseCount, 
      this.driverNote, 
      this.status, 
      this.resumeAt, 
      this.deliveryType, 
      this.branchId, 
      this.userId, 
      this.addressId, 
      this.driverId, 
      this.packageId, 
      this.periodId, 
      this.requested, 
      this.totalWithoutVat, 
      this.discountValue, 
      this.totalWithVat, 
      this.vat, 
      this.paymentId, 
      this.discountId, 
      this.delivery, 
      this.generatedCodeTLV, 
      this.period,});

  Order.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    pausedAt = json['paused_at'];
    pauseCount = json['pause_count'];
    driverNote = json['driver_note'];
    status = json['status'];
    resumeAt = json['resume_at'];
    deliveryType = json['delivery_type'];
    branchId = json['branch_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    driverId = json['driver_id'];
    packageId = json['package_id'];
    periodId = json['period_id'];
    requested = json['requested'];
    totalWithoutVat = json['total_without_vat'];
    discountValue = json['discount_value'];
    totalWithVat = json['total_with_vat'];
    vat = json['vat'];
    paymentId = json['payment_id'];
    discountId = json['discount_id'];
    delivery = json['delivery'];
    generatedCodeTLV = json['generated_code_TLV'];
    period = json['period'] != null ? Period.fromJson(json['period']) : null;
  }
  int? id;
  String? quantity;
  String? startDate;
  String? endDate;
  dynamic pausedAt;
  int? pauseCount;
  dynamic driverNote;
  String? status;
  dynamic resumeAt;
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
  dynamic discountId;
  String? delivery;
  dynamic generatedCodeTLV;
  Period? period;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['paused_at'] = pausedAt;
    map['pause_count'] = pauseCount;
    map['driver_note'] = driverNote;
    map['status'] = status;
    map['resume_at'] = resumeAt;
    map['delivery_type'] = deliveryType;
    map['branch_id'] = branchId;
    map['user_id'] = userId;
    map['address_id'] = addressId;
    map['driver_id'] = driverId;
    map['package_id'] = packageId;
    map['period_id'] = periodId;
    map['requested'] = requested;
    map['total_without_vat'] = totalWithoutVat;
    map['discount_value'] = discountValue;
    map['total_with_vat'] = totalWithVat;
    map['vat'] = vat;
    map['payment_id'] = paymentId;
    map['discount_id'] = discountId;
    map['delivery'] = delivery;
    map['generated_code_TLV'] = generatedCodeTLV;
    if (period != null) {
      map['period'] = period?.toJson();
    }
    return map;
  }

}

class Period {
  Period({
      this.id, 
      this.from, 
      this.to, 
      this.fromDescriptionEn, 
      this.fromDescriptionAr, 
      this.toDescriptionEn, 
      this.toDescriptionAr, 
      this.name,});

  Period.fromJson(dynamic json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    fromDescriptionEn = json['from_description_en'];
    fromDescriptionAr = json['from_description_ar'];
    toDescriptionEn = json['to_description_en'];
    toDescriptionAr = json['to_description_ar'];
    name = json['name'];
  }
  int? id;
  String? from;
  String? to;
  String? fromDescriptionEn;
  String? fromDescriptionAr;
  String? toDescriptionEn;
  String? toDescriptionAr;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['from'] = from;
    map['to'] = to;
    map['from_description_en'] = fromDescriptionEn;
    map['from_description_ar'] = fromDescriptionAr;
    map['to_description_en'] = toDescriptionEn;
    map['to_description_ar'] = toDescriptionAr;
    map['name'] = name;
    return map;
  }

}