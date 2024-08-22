// signin_state.dart

import 'package:equatable/equatable.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class Authenticating extends SigninState {}

class Authenticated extends SigninState {
  final UserRegisterInfo user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationFailed extends SigninState {
  final String message;

  const AuthenticationFailed(this.message);

  @override
  List<Object> get props => [message];
}
