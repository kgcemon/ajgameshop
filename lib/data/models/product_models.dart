class Products {
  String? sId;
  String? name;
  String? img;
  String? price;
  String? description;

  Products({this.sId, this.name, this.img, this.price, this.description});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}