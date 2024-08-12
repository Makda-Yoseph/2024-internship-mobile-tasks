
import 'dart:io';

// import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/product/Data/Data_source/remote_data_source/remote_data_src.dart';
import 'package:myapp/features/product/Data/models/product_model.dart';
import 'package:test/test.dart';
import 'dart:convert';

import '../../../../../helper/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

// @GenerateMocks([HttpClient])



void main(){
  late MockClient mockClient;
  late RemoteSource remotesrc;
  setUp(() {
    mockClient = MockClient();
    remotesrc = RemoteSource(client: mockClient);
  });
  group('get all items', (){

     final List<ProductModel> testProducts = [
      ProductModel(id: '1', name: 'Product 1', description: 'Description 1', price: 10.0, imageUrl: 'path/to/image1'),
      ProductModel(id: '2', name: 'Product 2', description: 'Description 2', price: 20.0, imageUrl: 'path/to/image2'),
    ];

    test('return items if status code 200', 
    ()async{
      when(
        mockClient.get(any)
      ).thenAnswer((_)async=>http.Response(json.encode(testProducts.map((product) => product.toJson()).toList()), 200));

      final result = await remotesrc.getAllProducts();
      
      expect(result.isRight(), true);
      expect(result.getOrElse(() => []), testProducts);
    }
    );

  });
}