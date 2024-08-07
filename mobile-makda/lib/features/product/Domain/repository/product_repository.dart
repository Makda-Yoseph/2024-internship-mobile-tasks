// import 'package:todoappwithcleanarchitecture/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';

abstract class productRepo{
  Future<Either<Failure,List<product>>>getallItem();
   Future<Either<Failure,product>>addItem(product item);
   Future<Either<Failure,void>>deleteProduct(String id);
   Future<Either<Failure,product>>updateProduct(product item);
   Future<Either<Failure,product>>getitem(String id);

}