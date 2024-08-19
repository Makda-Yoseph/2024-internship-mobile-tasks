import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/product/Domain/usecase/add_product.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_event.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_state.dart';
import 'package:myapp/service_locator.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final AddProduct addProduct;

  AddBloc() : 
    addProduct = getIt<AddProduct>(), 
    super(AddingState()) {
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onFormSubmitted(FormSubmitted event, Emitter<AddState> emit) async {
    emit(AddingState());

    final product = event.Product;

    if (product.name.isEmpty ||
        product.description.isEmpty ||
        product.imageUrl.isEmpty ||
        product.price <= 0) {
      emit(AddFailure("Please fill in all the fields correctly."));
      return;
    }

    try {
      final result = await addProduct.execute(product);

      result.fold(

        (failure) { 
          // print(failure);
          emit(AddFailure("Failed to add product."));},
        (success) => emit(AddedState()),
      );
    } catch (error) {
      // print(error);
      emit(AddFailure(error.toString()));
    }
  }
}
