import 'package:dartz/dartz.dart';
import 'package:myapp/core/connectivity/connection.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Data/Data_source/Local_data_source/local_data_src.dart';
import 'package:myapp/features/product/Data/Data_source/remote_data_source/remote_data_src.dart';
import 'package:myapp/features/product/Data/models/product_model.dart';


abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel>> addItem(ProductModel item);
  Future<Either<Failure, void>> deleteProduct(String id);
  Future<Either<Failure, ProductModel>> updateItem(ProductModel item);
  Future<Either<Failure, ProductModel>> getProduct(String id);
}

class ProductRepositoryImpl implements ProductRepository {
  final RemoteSource remoteSource;
  final LocalDataSrc localDataSrc;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteSource,
    required this.localDataSrc,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.isConnected()) {
      
      final remoteResult = await remoteSource.getAllProducts();
      return remoteResult.fold(
        (failure) => Left(failure),
        (products) {
          
          products.forEach((product) => localDataSrc.localaddItem(product));
          return Right(products);
        },
      );
    } else {
      
      return await localDataSrc.localgetAllProducts();
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProduct(String id) async {
    if (await networkInfo.isConnected()) {
     
      final remoteResult = await remoteSource.getProduct(id);
      return remoteResult.fold(
        (failure) => Left(failure),
        (product) {
         
          localDataSrc.localaddItem(product);
          return Right(product);
        },
      );
    } else {
     
      return await localDataSrc.localgetProduct(id);
    }
  }

  @override
  Future<Either<Failure, ProductModel>> addItem(ProductModel item) async {
    if (await networkInfo.isConnected()) {
      
      final remoteResult = await remoteSource.addItem(item);
      return remoteResult.fold(
        (failure) => Left(failure),
        (product) {
         
          localDataSrc.localaddItem(product);
          return Right(product);
        },
      );
    } else {
      
      return await localDataSrc.localaddItem(item);
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateItem(ProductModel item) async {
    if (await networkInfo.isConnected()) {
    
      final remoteResult = await remoteSource.updateItem(item);
      return remoteResult.fold(
        (failure) => Left(failure),
        (product) {
         
          localDataSrc.localupdateItem(product);
          return Right(product);
        },
      );
    } else {
     
      return await localDataSrc.localupdateItem(item);
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
