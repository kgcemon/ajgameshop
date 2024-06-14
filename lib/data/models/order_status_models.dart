class OrderStatusModels {
  int? statusCode;
  String? success;
  String? message;
  List<Data>? data;

  OrderStatusModels({this.statusCode, this.success, this.message, this.data});

  OrderStatusModels.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'].toString();
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? sId;
  String? userId;
  String? status;
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
    status = json['status'].toString();
    img = json['img'];
    price = json['price'];
    productName = json['productName'];
    playerId = json['playerId'];
    orderNumber = json['orderNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
