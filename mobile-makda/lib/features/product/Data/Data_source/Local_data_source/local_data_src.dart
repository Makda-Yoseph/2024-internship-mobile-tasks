



import 'dart:convert';
// import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Data/models/product_model.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class localprod extends Equatable{

  
  Future<Either<Failure, List<ProductModel>>> localgetAllProducts();
  Future<Either<Failure, ProductModel>> localaddItem(ProductModel item);
  Future<Either<Failure, void>> localdeleteProduct(String id);
  Future<Either<Failure, ProductModel>> localupdateItem(ProductModel item);
  Future<Either<Failure, ProductModel>> localgetProduct(String id);


}

class LocalDataSrc implements localprod
{

  @override
  List<Object?> get props => [];

   @override
  bool get stringify => true; 

  @override
  Future<Either<Failure, ProductModel>> localgetProduct(String id)async {
     try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(id);

    if (jsonString != null) {
      
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      ProductModel product = ProductModel.formjson(jsonMap);
      return Right(product);
    } else {
      
      return Left(ProductNotFoundError());
    }
  } catch (e) {
    
    return Left(CachingError());
  }
}

  @override
  Future<Either<Failure, ProductModel>> localaddItem(ProductModel item) async{
    try {
      SharedPreferences prefs =await SharedPreferences.getInstance();
      String jsonstring = jsonEncode(item.toJson());

    await prefs.setString('${item.id}', jsonstring);
    return Right(item);
      
    } catch (e) {
      return Left(CachingError());
      
    }
  }
  
  @override
  Future<Either<Failure, List<ProductModel>>> localgetAllProducts() async{
     try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();

    if (keys.isNotEmpty) {
      List<ProductModel> products = [];

      for (String key in keys) {
        String? jsonString = prefs.getString(key);
        if (jsonString != null) {
          products.add(ProductModel.formjson(jsonDecode(jsonString)));
        }
      }

      return Right(products);
    } else {
      return Left(CachingError()); 
    }
  } catch (e) {
      return Left(CachingError());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> localupdateItem(ProductModel item)async {
    try {
      SharedPreferences prefs =await SharedPreferences.getInstance();
      String jsonstring = jsonEncode(item.toJson());

    await prefs.setString('${item.id}', jsonstring);
    return Right(item);
      
    } catch (e) {
      return Left(CachingError());
      
    }
  }
    
  

  

  @override
  Future<Either<Failure, void>> localdeleteProduct(String id)async {
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? productJson = prefs.getString(id);

      if (productJson != null) {
       
        ProductModel product = ProductModel.formjson(jsonDecode(productJson));

        
        await prefs.remove(id);

       
        return Right(null);


      
    }
    else{
      return Left(CachingError());
    }
  
  }
   catch (e) {
      
      return Left(CachingError());
    }
  

   
  
}
}






     