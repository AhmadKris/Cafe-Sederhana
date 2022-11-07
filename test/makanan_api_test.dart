import 'package:cafe_sederhana/models/model_makanan.dart';
import 'package:cafe_sederhana/services/service_makanan.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'makanan_api_test.mocks.dart';

@GenerateMocks([ServiceMakanan])
void main() {
  group('FoodApi', () {
    ServiceMakanan foodApi = MockServiceMakanan();

    test('get all foods returns data', () async {
      when(foodApi.getAllFoods()).thenAnswer(
        (_) async => <ModelMakanan>[
          ModelMakanan(
              id: 1,
              name: 'Nasi Goreng Ayam',
              image:
                  'https://asset.kompas.com/crops/N0sk4nA9PHwFZWLQmKOgXOzmWLo=/4x0:1000x664/750x500/data/photo/2022/05/04/627208b727a09.jpg',
              price: '12000',
              qty: 1),
        ],
      );
      var foods = await foodApi.getAllFoods();
      expect(foods.isNotEmpty, true);
    });
  });
}
