

import 'package:ajgameshop/data/models/product_models.dart';

class CategoryData {
  String? sId;
  String? name;
  String? img;
  String? description;
  List<Products>? products;

  CategoryData({this.sId, this.name, this.img, this.description, this.products});

  CategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    img = json['img'];
    description = json['description'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['img'] = img;
    data['description'] = description;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}