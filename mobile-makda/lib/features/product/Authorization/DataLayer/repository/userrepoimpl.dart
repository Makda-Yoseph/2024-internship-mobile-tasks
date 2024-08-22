import 'package:dartz/dartz.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Authorization/DataLayer/DataSource/remotedata.dart';
// import 'package:myapp/features/product/Authorization/DataLayer/datasource/remote_src.dart'; // Path to your RemoteSrc class
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/repository/userrepo.dart';
import 'package:myapp/features/product/Authorization/DataLayer/models/userinfomodel.dart';

class UserRepoImpl implements Userrepo {
  final RemoteSrc remoteSrc;

  UserRepoImpl({required this.remoteSrc});

  @override
  Future<Either<Failure, UserRegisterInfo>> adduser(UserRegisterInfo userinfo) async {
    final userModel = Userinfomodel(
      name: userinfo.name,
      email: userinfo.email,
      password: userinfo.password,
    );

    
    final result = await remoteSrc.addUser(userModel);

    return result.fold(
      (failure) => Left(failure),
      (userModel) => Right(UserRegisterInfo(
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
      )),
    );
  }

  @override
  Future<Either<Failure, UserRegisterInfo>> getuser(String email, String password) async {
    final result = await remoteSrc.getuser(email, password);
    return result.fold(
      (failure) => Left(failure),
      (userModel) => Right(UserRegisterInfo(
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
      )),
    );
  }
}
