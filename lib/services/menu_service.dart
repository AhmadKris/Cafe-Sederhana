import 'package:cafe_sederhana/models/menu_model.dart';
import 'package:cafe_sederhana/utils/urls.dart';
import 'package:dio/dio.dart';

class MenuService {
  final Dio _dio = Dio();

  Future<List<MenuModel>> getAllMenu() async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.menu,
      );

      return List<MenuModel>.from(
          response.data.map((e) => MenuModel.fromJson(e)).toList());
    } on DioError catch (_) {
      rethrow;
    }
  }
}
