import 'package:dartz/dartz.dart';
import 'package:myapp/core/connectivity/connection.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Data/Data_source/Local_data_source/local_data_src.dart';
import 'package:myapp/features/product/Data/Data_source/remote_data_source/remote_data_src.dart';
import 'package:myapp/features/product/Data/models/product_model.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/repository/product_repository.dart';


// abstract class ProductRepository {
//   Future<Either<Failure, List<ProductModel>>> getAllProducts();
//   Future<Either<Failure, ProductModel>> addItem(ProductModel item);
//   Future<Either<Failure, void>> deleteProduct(String id);
//   Future<Either<Failure, ProductModel>> updateItem(ProductModel item);
//   Future<Either<Failure, ProductModel>> getProduct(String id);
// }
// abstract class productRepo{
//   Future<Either<Failure,List<product>>>getallItem();
//    Future<Either<Failure,product>>addItem(product item);
//    Future<Either<Failure,void>>deleteProduct(String id);
//    Future<Either<Failure,product>>updateProduct(product item);
//    Future<Either<Failure,product>>getitem(String id);

// }

class ProductRepositoryImpl implements productRepo {
  final RemoteSource remoteSource;
  final LocalDataSrc localDataSrc;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteSource,
    required this.localDataSrc,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<product>>> getAllProducts() async {
    if (await networkInfo.isConnected()) {
      
      final remoteResult = await remoteSource.getAllProducts();
      print(remoteResult);
      return remoteResult.fold(
        (failure) {
          print('an apple a day keet a docotr away');
          return Left(failure);},
        (products) {
          
         for (var prd in products) {
          localDataSrc.localaddItem(prd);
         }
          return Right(products);
        },
      );
    } else {
      
      return await localDataSrc.localgetAllProducts();
    }
  }

  @override
  Future<Either<Failure, product>> getProduct(String id) async {
    if (await networkInfo.isConnected()) {
     
      final remoteResult = await remoteSource.getProduct(id);
      return remoteResult.fold(
        (failure) => Left(failure),
        (prd) {
         
          localDataSrc.localaddItem(prd);
          return Right(prd);
        },
      );
    } else {
     
      return await localDataSrc.localgetProduct(id);
    }
  }

  @override
  Future<Either<Failure, product>> addItem(product item) async {
     final ProductModel itemModel =ProductModel(name: item.name, imageUrl: item.imageUrl, price: item.price, description: item.description, id: item.id); 
    
    if (await networkInfo.isConnected()) {
      final remoteResult = await remoteSource.addItem(itemModel);
      return remoteResult.fold(
        (failure) => Left(failure),
        (productModel) {
          localDataSrc.localaddItem(productModel);
          return Right(productModel);
        },
      );
    } else {
      return await localDataSrc.localaddItem(itemModel);
    }
    
  }

  @override
Future<Either<Failure, product>> updateItem(product item) async {
  final ProductModel itemModel =ProductModel(name: item.name, imageUrl: item.imageUrl, price: item.price, description: item.description, id: item.id); 

  if (await networkInfo.isConnected()) {
    
    final remoteResult = await remoteSource.updateItem(itemModel);
    
    return remoteResult.fold(
      (failure) => Left(failure),
      (updatedProductModel) {
        
        localDataSrc.localupdateItem(updatedProductModel);
        return Right(updatedProductModel);
      },
    );
  } else {
    
    return await localDataSrc.localupdateItem(itemModel);
  }
}


  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    if (await networkInfo.isConnected()) {
     
      final remoteResult = await remoteSource.deleteProduct(id);
      return remoteResult.fold(
        (failure) => Left(failure),
        (success) {
        
          localDataSrc.localdeleteProduct(id);
          return Right(success);
        },
      );
    } else {
     
      return await localDataSrc.localdeleteProduct(id);
    }
  }
}
