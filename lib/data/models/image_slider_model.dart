class sliderImageModel {
  int? statusCode;
  bool? success;
  String? message;
  List<Data>? data;

  sliderImageModel({this.statusCode, this.success, this.message, this.data});

  sliderImageModel.fromJson(Map<String, dynamic> json) {
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
  String? link;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId, this.link, this.img, this.createdAt, this.updatedAt, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    link = json['link'];
    img = json['img'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['link'] = this.link;
    data['img'] = this.img;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
