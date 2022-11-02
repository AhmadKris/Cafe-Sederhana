import 'package:cafe_sederhana/models/model_cemilan.dart';
import 'package:dio/dio.dart';

class ServiceCemilan {
  late Dio _dio;
  final url =
      "https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app/cemilan.json";

  ServiceCemilan() {
    _dio = Dio();
  }

  Future<List<ModelCemilan>> getAllSnacks() async {
    final res = await _dio.get(url);
    print(res);

    if (res.data != null) {
      return List<ModelCemilan>.from(
        res.data.map((e) => ModelCemilan.fromJson(e)).toList(),
      );
    }
    return [];
  }
}
