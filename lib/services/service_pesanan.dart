import 'package:cafe_sederhana/models/model_pesanan.dart';
import 'package:cafe_sederhana/utils/urls.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicePesanan {
  final Dio _dio = Dio();

  Future postPesanan(PesananModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    try {
      final response =
          await _dio.post(Urls.baseUrl + Urls.pesanan, data: data.toJson());
      await prefs.setString("id_pesanan", response.data['name']);

      return response;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<PesananModel> getPesanan() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String id;
    id = prefs.getString("id_pesanan").toString();
    try {
      final response = await _dio.get('${Urls.baseUrl}/pesanan/$id.json');

      return PesananModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
