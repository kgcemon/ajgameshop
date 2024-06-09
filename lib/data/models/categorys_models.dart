import 'category_data.dart';

class CategoryModels {
  int? statusCode;
  bool? success;
  String? message;
  List<CategoryData>? categoryData;

  CategoryModels({this.statusCode, this.success, this.message, this.categoryData});

  CategoryModels.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      categoryData = <CategoryData>[];
      json['data'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.categoryData != null) {
      data['data'] = this.categoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




