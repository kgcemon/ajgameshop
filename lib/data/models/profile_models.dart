class ProfileModels {
  final int statusCode;
  final bool success;
  final String message;
  final ProfileData data;

  ProfileModels({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileModels.fromJson(Map<String, dynamic> json) {
    return ProfileModels(
      statusCode: json['statusCode'],
      success: json['success'],
      message: json['message'],
      data: ProfileData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProfileData {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String img;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final String wallet;

  ProfileData({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.wallet,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['_id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      img: json['img'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
      wallet: json['wallet'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'img': img,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
      'wallet': wallet,
    };
  }
}
