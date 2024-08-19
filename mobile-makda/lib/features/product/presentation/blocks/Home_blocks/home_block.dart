import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/product/Domain/usecase/getAll_product.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_event.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_state.dart';

class HomeBloc extends Bloc<ImageEvent, ImageState> {
  final GetAllProd getallproduct;

  HomeBloc({required this.getallproduct}) : super(ImageLoadingState()) {
    on<ImageFetch>(_onImageFetch);
  }

  Future<void> _onImageFetch(
    ImageFetch event,
    Emitter<ImageState> emit,
  ) async {
    emit(ImageLoadingState());

    final result = await getallproduct.execute();
    print(result);

    result.fold(
      (failure) {
        emit(ImageLoadFailState());
      },
      (products) {
        emit(ImageLoaded(products));
      },
    );
  }
}
