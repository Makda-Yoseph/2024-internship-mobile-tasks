import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';
// import 'package:myapp/features/product/Authorization/DomainLayer/entities/user_register_info.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/repository/userrepo.dart';

class Signin {
  final Userrepo userrepo;

  Signin(this.userrepo);

  Future<Either<Failure, UserRegisterInfo>> execute(String email, String password) {
    return userrepo.getuser(email, password);
  }
}