
import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Domain/repository/product_repository.dart';

class Deleteprod{
  final productRepo prodrep;
  Deleteprod(this.prodrep);
  Future<Either<Failure,void >>execute(String id){
    return prodrep.deleteProduct(id);
  }
}