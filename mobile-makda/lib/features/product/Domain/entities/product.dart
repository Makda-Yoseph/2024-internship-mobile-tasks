import 'package:equatable/equatable.dart';


class product extends Equatable{
  final String name;
  final String category;
  final double price;
  final String description;
  final String id;
  product({required this.name,required this.category,required this.price,required this.description,required this.id});
  @override
  List<Object?>get props =>[
    name,category,price,description,id
  ];

}