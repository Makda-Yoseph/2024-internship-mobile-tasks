import 'package:equatable/equatable.dart';

abstract class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object?> get props => [];
}

class Updatingstate  extends UpdateState {}

class Updatedstate extends UpdateState {}

class Updatefailure extends UpdateState {
  final String error;

  Updatefailure(this.error);

  @override
  List<Object?> get props => [error];
}
