import 'package:equatable/equatable.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object?> get props => [];
}

class AddingState extends AddState {}

class AddedState extends AddState {}

class AddFailure extends AddState {
  final String error;

  AddFailure(this.error);

  @override
  List<Object?> get props => [error];
}
