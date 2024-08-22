import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Authorization/DataLayer/models/userinfomodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteSrc extends Equatable {
  Future<Either<Failure, Userinfomodel>> addUser(Userinfomodel userinfo);
  Future<Either<Failure, Userinfomodel>> getuser(String email, String password);

  @override
  List<Object?> get props => [];
}

class RemoteSrcImpl extends RemoteSrc {
  final http.Client client;

  RemoteSrcImpl({required this.client});

  @override
  Future<Either<Failure, Userinfomodel>> addUser(Userinfomodel userinfo) async {
    try {
      final body = {
        'name': userinfo.name,
        'email': userinfo.email,
        'password': userinfo.password,
      };

      final response = await client.post(
        Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      // print(response.body);
      // print(response.statusCode);
      if ( response.statusCode == 201) {
        final jsonResponse = json.decode(response.body)as Map<String,dynamic>;
       
        final userData = jsonResponse['data'];
            // print(userData);

          
            final user = Userinfomodel(
              name: userData['name'],
              email: userData['email'],
              password: userinfo.password, 
            );
        return Right(user);
      } else {
        print('here is the error');
        return Left(ServerFailure());
      }
    } catch (e) {
      
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Userinfomodel>> getuser(String email, String password) async {
     try {
    final body = {
      'email': email,
      'password': password,
    };

    final response = await client.post(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login'), 
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    // print(response.body);
    // print(response.statusCode);

    if (response.statusCode == 201) { // Changed to 200, assuming successful login
      final jsonResponse = json.decode(response.body)['data'] as Map<String, dynamic>;
      final token = jsonResponse['access_token'];
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);
        // print(token);

        // Fetch user details
        try {
          final userResponse = await client.get(
            Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/users/me'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          );

          if (userResponse.statusCode == 200) {
            final userJsonResponse = json.decode(userResponse.body) as Map<String, dynamic>;
            final userData = userJsonResponse['data'];
            final name = userData['name'];
            await prefs.setString('auth_name', name);
            print(name);

            // Create the Userinfomodel instance
            final user = Userinfomodel(
              name: userData['name'],
              email: userData['email'],
              password: password, // The password you provided in the login
            );

            return Right(user);
          } else {
            print('Error fetching user details');
            return Left(ServerFailure());
          }
        } catch (e) {
          print('Error during user detail fetching: $e');
          return Left(NetworkFailure());
        }
      } else {
        print('Token is null');
        return Left(ServerFailure());
      }
    } else {
      print('Login failed with status code: ${response.statusCode}');
      return Left(ServerFailure());
    }
  } catch (e) {
    print('Login request failed: $e');
    return Left(NetworkFailure());
  }
}
}