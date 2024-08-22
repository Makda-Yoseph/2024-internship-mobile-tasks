

import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';

class Userinfomodel extends UserRegisterInfo {
  Userinfomodel({
    required super.name,
    required super.email,
    required super.password
   
  });
  factory Userinfomodel.formJson(Map<String, dynamic> json) {
    return Userinfomodel(
        name: json['name'],
        email: json['email'],
        password: json['password']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
