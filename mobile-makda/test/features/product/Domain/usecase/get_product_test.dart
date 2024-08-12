


import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/usecase/get_product.dart';
import 'package:test/test.dart';

import '../../../../helper/add_test_helper.mocks.dart';

void main(){

  late  MockproductRepo mockproductrepo;
  late  GetProduct getProduct;
  setUp((){
    mockproductrepo = MockproductRepo();
    getProduct = GetProduct(mockproductrepo);
  });
final item = product(name: 'kids shoe', imageUrl: 'kids', price: 200, description: 'cool for kids', id: '3');
final id = '3';
test('get a single item by id'
,()async{
  when(mockproductrepo.getitem(id)).thenAnswer((_)async=>Right(item));

  final result = await getProduct.execute(id);

  expect(result, Right(item));
}


);

}