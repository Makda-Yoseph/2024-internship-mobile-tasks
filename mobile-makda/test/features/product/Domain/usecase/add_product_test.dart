



import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/Domain/usecase/add_product.dart';
import 'package:test/test.dart';

import '../../../../helper/add_test_helper.mocks.dart';

void main(){

  late AddProduct addprod;
  late MockproductRepo mockprodrepo;
  setUp((){
    mockprodrepo = MockproductRepo();
    addprod = AddProduct(mockprodrepo);
  });

  final item = product(
    name: 'kids sneaker', 
  imageUrl: 'kids',
   price: 200, 
   description: 'good for kids ', 
   id: '1',
   );
  
  test('add items successfully',
  ()async{
    //arrange
    when(
        mockprodrepo.addItem(item)
    ).thenAnswer((_) async=> Right(item));
    //act
    final result = await addprod.execute(item);
    //assert
    expect(result,Right(item));
  }
    
    );
}