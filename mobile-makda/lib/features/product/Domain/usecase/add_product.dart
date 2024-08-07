

import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/repository/product_repository.dart';
class AddProduct{
  final productRepo prodrep;
  AddProduct(this.prodrep);
  Future<Either<Failure,product >>execute(product item){
    return prodrep.addItem(item);
  }
}