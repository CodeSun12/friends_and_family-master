/// id : 1
/// name : "Dalda Cooking Oil Tin"
/// uom : "Ltr"
/// weight : "5.000"
/// price : "2455.00"
/// expiry_date : null

// class ProductModel {
//   ProductModel({
//
//       int? id,
//       String? name,
//       String? uom,
//       String? weight,
//       String? price,
//       String? productPrice,
//       dynamic expiryDate,}){
//     _id = id;
//     _name = name;
//     _uom = uom;
//     _weight = weight;
//     _price = price;
//     _expiryDate = expiryDate;
// }
//
//   ProductModel.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _uom = json['uom'];
//     _weight = json['weight'];
//     _price = json['price'];
//     _expiryDate = json['expiry_date'];
//   }
//   int? _id;
//   String? _name;
//   String? _uom;
//   String? _weight;
//   String? _price;
//   dynamic _expiryDate;
// ProductModel copyWith({  int? id,
//   String? name,
//   String? uom,
//   String? weight,
//   String? price,
//   dynamic expiryDate,
// }) => ProductModel(  id: id ?? _id,
//   name: name ?? _name,
//   uom: uom ?? _uom,
//   weight: weight ?? _weight,
//   price: price ?? _price,
//   expiryDate: expiryDate ?? _expiryDate,
// );
//   int? get id => _id;
//   String? get name => _name;
//   String? get uom => _uom;
//   String? get weight => _weight;
//   String? get price => _price;
//   dynamic get expiryDate => _expiryDate;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['uom'] = _uom;
//     map['weight'] = _weight;
//     map['price'] = _price;
//     map['expiry_date'] = _expiryDate;
//     return map;
//   }
//
// }

class Cart {

  late final int? id;
  final String? productName;
  final String? initialPrice;
  final String? weight;
  final int? quantity;
  final String? unitTag;

  Cart({
    required this.id ,
    required this.productName,
    required this.initialPrice,
    required this.weight,
    required this.quantity,
    required this.unitTag,
  });

  Cart.fromMap(Map<dynamic , dynamic>  res)
      : id = res['id'],
        productName = res["productName"],
        initialPrice = res["initialPrice"],
        weight = res["weight"],
        quantity = res["quantity"],
        unitTag = res["unitTag"];

  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'productName' :productName,
      'initialPrice' : initialPrice,
      'weight' : weight,
      'quantity' : quantity,
      'unitTag' : unitTag,
    };
  }
}