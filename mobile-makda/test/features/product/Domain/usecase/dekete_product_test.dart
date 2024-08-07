



import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/product/Domain/usecase/delete_product.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../../../helper/add_test_helper.mocks.dart';

void main(){
  late Deleteprod deleteprod;
  late MockproductRepo mockprodrepo;
  setUp((){
    mockprodrepo = MockproductRepo();
    deleteprod = Deleteprod(mockprodrepo);
  });
  final id = '1';
  test("to delete an item",
    ()async{

      //arrange
      when (mockprodrepo.deleteProduct(id)).thenAnswer( (_) async=>Right(id));
      //act
      final result = await deleteprod.execute(id);
      //assert
      expect(result, Right(id));
    }
    
    );
}