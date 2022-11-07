import 'package:cafe_sederhana/models/model_minuman.dart';
import 'package:dio/dio.dart';

class ServiceMinuman {
  late Dio _dio;
  final url =
      "https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app/minuman.json";

  ServiceMinuman() {
    _dio = Dio();
  }

  Future<List<ModelMinuman>> getAllDrinks() async {
    final res = await _dio.get(url);
    // print(res);

    if (res.data != null) {
      return List<ModelMinuman>.from(
        res.data.map((e) => ModelMinuman.fromJson(e)).toList(),
      );
    }

    return [];
  }
}
