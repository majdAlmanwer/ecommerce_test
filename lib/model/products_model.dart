// ignore_for_file: camel_case_types, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
class ProductListModel {
  List<Products_Model>? data;

  ProductListModel({
    this.data,
  });

  ProductListModel.fromJson(List<dynamic> json) {
    if (json != null) {
      data = <Products_Model>[];
      json.forEach((v) {
        data!.add(Products_Model.fromJson(v));
      });
    }
  }

  List<dynamic> toJson() {
    final List<dynamic> data = [];
    if (this.data != null) {
      data.addAll(this.data!.map((v) => v.toJson()).toList());
    }

    return data;
  }
}

class Products_Model {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Products_Model(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  Products_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
