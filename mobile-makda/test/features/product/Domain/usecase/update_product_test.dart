





import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/usecase/update._product.dart';
import 'package:test/test.dart';

import '../../../../helper/add_test_helper.mocks.dart';

void main(){

 late MockproductRepo mockprodrep;
 late Updateprod updateprod;

 setUp((){
  mockprodrep = MockproductRepo();
  updateprod = Updateprod(mockprodrep);
 });

final item = product(name: 'kids shoes', category: 'kids', price: 200, description: 'for infants', id: '2');


test('update the product instance'
,()async{
  when(mockprodrep.updateProduct(item)).thenAnswer((_)async=>Right(item));
  final result = await updateprod.execute(item);
  expect(result, Right(item));
}

);

}