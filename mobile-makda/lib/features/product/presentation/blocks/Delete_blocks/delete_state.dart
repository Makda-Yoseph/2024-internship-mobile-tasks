import 'package:equatable/equatable.dart';

abstract class DeleteState extends Equatable {
  const DeleteState();

  @override
  List<Object?> get props => [];
}

class Deleting extends DeleteState {}

class Deleted extends DeleteState {}

class DeleteFailure extends DeleteState {
  final String error;

  DeleteFailure(this.error);

  @override
  List<Object?> get props => [error];
}
