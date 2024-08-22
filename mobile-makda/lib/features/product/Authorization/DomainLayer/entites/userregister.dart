

import 'package:equatable/equatable.dart';

class UserRegisterInfo extends Equatable{

  final String name;
  final String email;
  final String password;
  UserRegisterInfo({
     required this.name,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [name,email,password];
}