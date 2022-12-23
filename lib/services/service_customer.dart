import 'package:cafe_sederhana/models/model_customer.dart';
import 'package:cafe_sederhana/utils/urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceCustomer {
  final Dio _dio = Dio();

  Future postUser(ModelCustomer data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(Urls.baseUrl + Urls.user, data: data);

      await prefs.setString("id_user", response.data["name"]);

      return response;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelCustomer> getUser() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String id;
    id = prefs.getString("id_user").toString();
    try {
      final response = await _dio.get('${Urls.baseUrl}/customer/$id.json');

      return ModelCustomer.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  // Future<List<ModelCustomer>> getCustomer() async {
  //   List<ModelCustomer> user = [];
  //   final response = await _dio.get(url);
  //   print(response);
  //   final extractedData = response.data as Map<String, dynamic>;
  //   if (extractedData.isEmpty) {
  //     return [];
  //   }
  //   extractedData.forEach((key, value) {
  //     user.add(
  //       ModelCustomer(id: key, name: value['nama'], number: value['nomor']),
  //     );
  //   });
  //   return user;
  // }
}
