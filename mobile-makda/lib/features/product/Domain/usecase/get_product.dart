

import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/repository/product_repository.dart';

class GetProduct{
  productRepo prodrep;
  GetProduct(this.prodrep);
  Future<Either<Failure,product >>execute(String id){
    return prodrep.getitem(id);
  }
}