import 'package:cafe_sederhana/models/model_pesanan.dart';
import 'package:flutter/foundation.dart';

class ProviderPesanan with ChangeNotifier {
  List<ModelPesanan> _list = [];

  // ProviderMakanan() {
  //   _serviceMakanan = ServiceMakanan();
  //   _fetchDataFoods();
  // }

  // void _fetchDataFoods() async {
  //   _list = await _serviceMakanan.getAllFoods();
  // }

  List<ModelPesanan> get list => [..._list];
  void addItem(ModelPesanan pesanan) {
    print(pesanan);
    _list.add(pesanan);
    notifyListeners();
  }
}
