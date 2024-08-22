

import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';

abstract class Userrepo{
  Future<Either<Failure,UserRegisterInfo>>adduser(UserRegisterInfo userinfo);
  Future<Either<Failure, UserRegisterInfo>>getuser(String email, String password);
}