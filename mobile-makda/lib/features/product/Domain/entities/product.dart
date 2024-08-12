import 'dart:io';

import 'package:equatable/equatable.dart';


class product extends Equatable{
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final String id;
  product({required this.name,required this.imageUrl,required this.price,required this.description,required this.id});
  @override
  List<Object?>get props =>[
    name,imageUrl,price,description,id
  ];

}