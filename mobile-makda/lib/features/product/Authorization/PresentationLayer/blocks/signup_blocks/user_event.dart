import 'package:equatable/equatable.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class Register extends UserEvent {
  final UserRegisterInfo userdata;

  Register({required this.userdata});
}

