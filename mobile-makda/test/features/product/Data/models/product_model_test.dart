



import 'dart:convert';

import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:test/test.dart';
import 'package:myapp/features/product/Data/models/product_model.dart';

// import '../../../../helper/json_reader.dart';
import '../../../../helper/dummy_data/dummy_image_giver.dart';
// import '/home/a2sv/Documents/makda_flutter_projs/2024-internship-mobile-tasks/mobile-makda/test/helper/dummy_data/dummy_image_giver.json';
import '/home/a2sv/Documents/makda_flutter_projs/2024-internship-mobile-tasks/mobile-makda/test/helper/json_reader.dart';

void main(){

  product testproductmodel = ProductModel(
    name: 'kids',
    imageUrl: 'kids',
    price: 200.0,
    description: 'for summer',
    id: '1',
  );

  test('check if is sub class of entity', () async {
    expect(testproductmodel, isA<product>());
  });

  test('return model from JSON', () async {
    final jsonMap = json.decode(dummyProduct);

    final result = ProductModel.formjson(jsonMap[0]);

    expect(result, (testproductmodel));
  });
}
