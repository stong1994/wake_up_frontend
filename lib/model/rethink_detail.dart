// 产品列表数据模型
class ProductListModel {
  // 状态码
  String code;

  // 状态信息
  String message;

  // 产品列表数据
  List<ProductModel> data;

  ProductListModel(this.data);

  ProductListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<ProductModel>();
      json['data'].forEach((v) {
        data.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// 产品数据模型
class ProductModel {
  String productID;
  String desc;
  String type;
  String name;
  String imageUrl;
  String point;

  ProductModel(
      {this.productID,
      this.desc,
      this.type,
      this.name,
      this.imageUrl,
      this.point});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    desc = json['desc'];
    type = json['type'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['desc'] = this.desc;
    data['type'] = this.type;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['point'] = this.point;
  }
}
