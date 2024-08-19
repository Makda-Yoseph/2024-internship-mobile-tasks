import 'package:equatable/equatable.dart';


abstract class DeleteEvent extends Equatable {
  const DeleteEvent();

  @override
  List<Object> get props => [];
}

class DeleteRequest extends DeleteEvent {
  final String id;

  DeleteRequest({required this.id});
}

