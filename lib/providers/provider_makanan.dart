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

  List<ModelMakanan> get listMakan => [...data];
  final List<ModelMakanan> data = [];

  void addMakan(ModelMakanan item) {
    data.add(item);
    notifyListeners();
    print(data.length);
  }

  void deleteMakanan(inx) {
    data.remove(inx);
    notifyListeners();
  }

  void clearData() {
    data.clear();
    notifyListeners();
  }
}
