import 'package:cafe_sederhana/models/model_customer.dart';
import 'package:dio/dio.dart';

class ServiceCustomer {
  late Dio _dio;
  final url =
      "https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app/customer.json";

  ServiceCustomer() {
    _dio = Dio();
  }

  Future<List<ModelCustomer>> getCustomer() async {
    List<ModelCustomer> user = [];
    final response = await _dio.get(url);
    print(response);
    final extractedData = response.data as Map<String, dynamic>;
    if (extractedData.isEmpty) {
      return [];
    }
    extractedData.forEach((key, value) {
      user.add(
        ModelCustomer(id: key, name: value['nama'], number: value['nomor']),
      );
    });
    return user;
  }
}
