import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductManager extends Equatable {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel>> addItem(ProductModel item);
  Future<Either<Failure, void>> deleteProduct(String id);
  Future<Either<Failure, ProductModel>> updateItem(ProductModel item);
  Future<Either<Failure, ProductModel>> getProduct(String id);
}

class RemoteSource implements ProductManager {
  final http.Client client;

  RemoteSource({required this.client});

  @override
  List<Object?> get props => [];

  @override     
  bool get stringify => true;

    Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
    }

  @override
Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
  try {
    final token = await _getToken();
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/products',),
      headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      
      final List<dynamic> jsonList = jsonResponse['data'];

      
      final List<ProductModel> products = jsonList
          .map((productJson) => ProductModel.formJson(productJson))
          .toList();

      
      return Right(products);
    } else {
      return Left(ServerFailure());
    }
  } catch (e) {
    print('Error: $e');
    return Left(NetworkFailure());
  }
}


  @override
  Future<Either<Failure, ProductModel>> getProduct(String id) async {
    try {
      // final response = await client.get(
      //   Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
      // );
      final token = await _getToken();
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/products/$id',),
      headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
    );

      if (response.statusCode == 200) {
        final jsonObj = json.decode(response.body);
        final product = ProductModel.formJson(jsonObj);
        return Right(product);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      final token = await _getToken();
      final response = await client.delete(
        Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/products/$id'),
         headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('got right success code');
        print("Response body: ${response.body}"); 
        return Right(null);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> addItem(ProductModel item) async {
    try {
      final token = await _getToken();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/products'),
        
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'multipart/form-data';

      request.fields['id'] = item.id;
      request.fields['name'] = item.name;
      request.fields['description'] = item.description;
      request.fields['price'] = item.price.toString();
      request.files.add(await http.MultipartFile.fromPath('image', item.imageUrl,contentType: MediaType('image','jpg')));
     
      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode == 201) {
        final response = await http.Response.fromStream(streamedResponse);
        final jsonResponse = json.decode(response.body)["data"];
        final product = ProductModel.formJson(jsonResponse);
        return Right(product);
      } else {
        
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateItem(ProductModel item) async {
    try {
      final token = await _getToken();
      final response = await client.put(
        Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/products/${item.id}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(item.toJson()),
      );  

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body)["data"];
        final product = ProductModel.formJson(jsonResponse);
        return Right(product);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }
}
