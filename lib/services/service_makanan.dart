import 'package:cafe_sederhana/models/model_makanan.dart';
import 'package:dio/dio.dart';

class ServiceMakanan {
  late Dio _dio;
  final url =
      "https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app";

  ServiceMakanan() {
    _dio = Dio();
  }

  Future<List<ModelMakanan>> getAllFoods() async {
    final response = await _dio.get('$url/makanan.json');
    // print(response);

    if (response.data != null) {
      return List<ModelMakanan>.from(
        response.data.map((e) => ModelMakanan.fromJson(e)).toList(),
      );
    }
    return [];
  }

  void postFood(ModelMakanan makanan) async {
    final res = await _dio.post('$url/pesanan.json', data: makanan.toJson());
    print(res);
  }
}
