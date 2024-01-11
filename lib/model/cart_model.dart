class CartModel {
  int? id;
  int quantity = 1;
  num? unitPrice;
  int? productId;
  String? itemName;
  String? itemImage;

  CartModel({
    this.id,
    this.quantity = 1,
    required this.unitPrice,
    required this.productId,
    this.itemImage,
    this.itemName,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    productId = json['productId'];
    itemName = json['itemName'];
    itemImage = json['itemImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['unitPrice'] = unitPrice;
    data['productId'] = productId;
    data['itemName'] = itemName;
    data['itemImage'] = itemImage;

    return data;
  }
}
