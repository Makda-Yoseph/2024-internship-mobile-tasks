


import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/repository/product_repository.dart';

class GetAllProd{
  final productRepo prodrep;
  GetAllProd(this.prodrep);
  Future<Either<Failure,List<product> >>execute( ){
    return prodrep.getAllProducts();
  }

}