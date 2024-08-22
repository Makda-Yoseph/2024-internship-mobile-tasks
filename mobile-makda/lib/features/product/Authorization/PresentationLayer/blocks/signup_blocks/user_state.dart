

import 'package:equatable/equatable.dart';

class UserState extends Equatable{
  const UserState();
  @override
  List<Object?> get props => [];

}
class Autenticating extends UserState{}
class Autenticated extends UserState{}
class AutenticateFailure extends UserState {
  final String error;

  AutenticateFailure(this.error);

  @override
  List<Object?> get props => [error];
}