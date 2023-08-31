class ProductsModel {
  String? message;
  List<Data>? data;

  ProductsModel({this.message, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
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
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? category;
  String? type;
  String? brand;
  String? model;
  int? price;
  int? discount;
  String? detail;
  String? proImage;
  int? createrId;
  int? updaterId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.category,
        this.type,
        this.brand,
        this.model,
        this.price,
        this.discount,
        this.detail,
        this.proImage,
        this.createrId,
        this.updaterId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    type = json['type'];
    brand = json['brand'];
    model = json['model'];
    price = json['price'];
    discount = json['discount'];
    detail = json['detail'];
    proImage = json['pro_image'];
    createrId = json['creater_id'];
    updaterId = json['updater_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['type'] = this.type;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['detail'] = this.detail;
    data['pro_image'] = this.proImage;
    data['creater_id'] = this.createrId;
    data['updater_id'] = this.updaterId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
