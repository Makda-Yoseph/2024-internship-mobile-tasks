import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/product/Domain/usecase/delete_product.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_event.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_state.dart';
import 'package:myapp/service_locator.dart';

class DeleteBlock extends Bloc<DeleteEvent, DeleteState> {
  final Deleteprod deleteproduct;

  DeleteBlock() : 
    deleteproduct = getIt<Deleteprod>(), 
    super(Deleting()) {
    on<DeleteRequest>(_onDeleteRequest);
  }

  void _onDeleteRequest(DeleteRequest event, Emitter<DeleteState> emit) async {
  emit(Deleting());

  final id = event.id;

  if (id == null || id.isEmpty) {
    emit(DeleteFailure("Please provide a valid product ID."));
    return;
  }

  try {
    final result = await deleteproduct.execute(id);

    result.fold(
      (failure) => emit(DeleteFailure("Failed to delete product.")),
      (success) => emit(Deleted()),
    );
  } catch (error) {
    emit(DeleteFailure("An unexpected error occurred: $error"));
  }
}

}
