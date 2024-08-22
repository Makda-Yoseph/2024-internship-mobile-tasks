





import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/repository/userrepo.dart';

class Signup {
  
  final Userrepo userrepo;
  Signup(this.userrepo);
  Future<Either<Failure,UserRegisterInfo >>execute(UserRegisterInfo userinfo){
    return userrepo.adduser(userinfo);
  }
  
  
}