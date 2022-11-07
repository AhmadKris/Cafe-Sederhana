import 'package:cafe_sederhana/models/model_minuman.dart';
import 'package:cafe_sederhana/services/service_minuman.dart';
import 'package:flutter/foundation.dart';

class ProviderMinuman with ChangeNotifier {
  late ServiceMinuman _serviceMinuman;
  List<ModelMinuman> _list = [];

  ProviderMinuman() {
    _serviceMinuman = ServiceMinuman();
    _fetchDataDrinks();
  }

  void _fetchDataDrinks() async {
    _list = await _serviceMinuman.getAllDrinks();
  }

  List<ModelMinuman> get list => [..._list];

  List<ModelMinuman> data = [];
  List<ModelMinuman> get listMinum => [...data];

  void addMinuman(ModelMinuman item) {
    data.add(item);
    notifyListeners();
    print(listMinum.length);
  }

  void deleteMinuman(idx) {
    data.remove(idx);
    notifyListeners();
  }

  void clearData() {
    data.clear();
    notifyListeners();
  }
}
