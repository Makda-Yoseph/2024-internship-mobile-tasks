





import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/usecase/getAll_product.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../../../helper/add_test_helper.mocks.dart';
void main(){
  late GetAllProd getprod;
 late MockproductRepo mockprodrep;
  setUp((){
    mockprodrep = MockproductRepo();
    getprod = GetAllProd(mockprodrep);
  });
final item = product(
    name: 'kids sneaker', 
  category: 'kids',
   price: 200, 
   description: 'good for kids ', 
   id: '1',
   );
final item2 = product(
  name:'kids wear',
  category: 'kids',
  price: 250,
  description: 'for summer wear',
  id: '2',
);
List <product> prdlis = [item,item2];


  test("to get all products in form of list"
  ,()async{
    //arrange
    when(mockprodrep.getallItem()).thenAnswer( (_) async=>Right(prdlis));
    //act
    final result = await getprod.execute();
    //assert
    expect(result, Right(prdlis));
  }
  );
}