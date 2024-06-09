class DepositeModels {
  int? statusCode;
  bool? success;
  String? message;
  List<DepositeData>? depositeListData;

  DepositeModels({this.statusCode, this.success, this.message, this.depositeListData});

  DepositeModels.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      depositeListData = <DepositeData>[];
      json['data'].forEach((v) {
        depositeListData!.add(new DepositeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.depositeListData != null) {
      data['data'] = this.depositeListData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DepositeData {
  String? sId;
  String? userId;
  String? status;
  String? amount;
  String? trxId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? phone;

  DepositeData(
      {this.sId,
        this.userId,
        this.status,
        this.amount,
        this.trxId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.phone});

  DepositeData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    status = json['status'];
    amount = json['amount'];
    trxId = json['trxId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['trxId'] = this.trxId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['phone'] = this.phone;
    return data;
  }
}
