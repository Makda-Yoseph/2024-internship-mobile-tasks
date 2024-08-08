




import '../../Domain/entities/product.dart';

class ProductModel extends product{
  ProductModel({
    required super.name,
    required super.category,
    required super.price,
    required super.description,
    required super.id,
  });
  factory ProductModel .formjson(Map<String,dynamic>json)=>ProductModel(name:json ['name'], category: json['category'], price: (json['price'] as num?)?.toDouble() ?? 0.0, description: json['description'], id: json['id']);
}
