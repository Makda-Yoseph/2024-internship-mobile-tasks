



  import 'package:equatable/equatable.dart';
// import 'package:myapp/features/product/Data/models/product_model.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/src/products.dart';
// import 'package:myapp/features/product/Domain/entities/product.dart';

  abstract class ImageState extends Equatable{
    @override
    List<Object?> get props =>[];
  }

 
  class ImageLoadingState extends ImageState{}

 
class ImageLoaded extends ImageState {
  final List<product> items;

  ImageLoaded(this.items);
}




  class ImageLoadFailState extends ImageState{}