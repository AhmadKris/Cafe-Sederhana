import 'package:cafe_sederhana/models/model_makanan.dart';
import 'package:cafe_sederhana/services/service_makanan.dart';
import 'package:flutter/foundation.dart';

class ProviderMakanan with ChangeNotifier {
  late ServiceMakanan _serviceMakanan;
  List<ModelMakanan> _list = [];

  ProviderMakanan() {
    _serviceMakanan = ServiceMakanan();
    _fetchDataFoods();
  }

  void _fetchDataFoods() async {
    _list = await _serviceMakanan.getAllFoods();
  }

  List<ModelMakanan> get list => [..._list];

  // void addFood(ModelMakanan makanan) {
  //   print(makanan);
  //   _list.add(makanan);
  //   notifyListeners();
  // }
}
