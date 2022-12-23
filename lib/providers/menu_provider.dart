import 'package:cafe_sederhana/models/menu_model.dart';
import 'package:cafe_sederhana/services/menu_service.dart';
import 'package:cafe_sederhana/utils/finite_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MenuProvider extends ChangeNotifier {
  final MenuService _menuService = MenuService();

  List<MenuModel> _menu = [];

  MyState myState = MyState.initial;

  Future fetchMenu() async {
    myState = MyState.loading;
    notifyListeners();

    try {
      _menu = await _menuService.getAllMenu();

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }

  List<MenuModel> get makanan =>
      _menu.where((element) => element.kategori == 'makanan').toList();
  List<MenuModel> get minuman =>
      _menu.where((element) => element.kategori == 'minuman').toList();
  List<MenuModel> get cemilan =>
      _menu.where((element) => element.kategori == 'cemilan').toList();
}
