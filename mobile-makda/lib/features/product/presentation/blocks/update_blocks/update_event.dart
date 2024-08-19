import 'package:equatable/equatable.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';

abstract class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

class UpdateFormSubmitted extends UpdateEvent {
  final product Product;

  UpdateFormSubmitted({required this.Product});
}

