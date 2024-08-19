import 'package:equatable/equatable.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object> get props => [];
}

class FormSubmitted extends AddEvent {
  final product Product;

  FormSubmitted({required this.Product});
}

