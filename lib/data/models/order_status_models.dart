class OrderStatusModels {
  int? statusCode;
  bool? success;
  String? message;
  List<Data>? data;

  OrderStatusModels({this.statusCode, this.success, this.message, this.data});

  OrderStatusModels.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  bool? status;
  String? img;
  String? price;
  String? productName;
  String? playerId;
  int? orderNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.status,
        this.img,
        this.price,
        this.productName,
        this.playerId,
        this.orderNumber,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    status = json['status'];
    img = json['img'];
    price = json['price'];
    productName = json['productName'];
    playerId = json['playerId'];
    orderNumber = json['orderNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['status'] = this.status;
    data['img'] = this.img;
    data['price'] = this.price;
    data['productName'] = this.productName;
    data['playerId'] = this.playerId;
    data['orderNumber'] = this.orderNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
