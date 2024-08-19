import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/product/Domain/usecase/add_product.dart';
import 'package:myapp/features/product/Domain/usecase/update._product.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_event.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_state.dart';
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_event.dart';
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_state.dart';
import 'package:myapp/service_locator.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  final Updateprod updateProduct;

  UpdateBloc() : 
    updateProduct = getIt<Updateprod>(), 
    super(Updatingstate()) {
    on<UpdateFormSubmitted>(_onFormSubmitted);
  }

  void _onFormSubmitted(UpdateFormSubmitted event, Emitter<UpdateState> emit) async {
    emit(Updatingstate());

    final product = event.Product;

    if (product.name.isEmpty ||
        product.description.isEmpty ||
        product.imageUrl.isEmpty ||
        product.price <= 0) {
      emit(Updatefailure("Please fill in all the fields correctly."));
      return;
    }

    try {
      final result = await updateProduct.execute(product);

      result.fold(

        (failure) { 
          // print(failure);
          emit(Updatefailure("Failed to add product."));},
        (success) => emit(Updatedstate()),
      );
    } catch (error) {
      // print(error);
      emit(Updatefailure(error.toString()));
    }
  }
}
