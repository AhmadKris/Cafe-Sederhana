import 'package:cafe_sederhana/models/model_pesanan.dart';
import 'package:cafe_sederhana/services/service_pesanan.dart';
import 'package:cafe_sederhana/utils/finite_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ProviderPesanan extends ChangeNotifier {
  final ServicePesanan _servicePesanan = ServicePesanan();
  PesananModel? pesanan;

  MyState myState = MyState.initial;
  Future buatPesanan(PesananModel data) async {
    myState = MyState.loading;
    notifyListeners();

    try {
      await _servicePesanan.postPesanan(data);

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

  List<DaftarPesanan> data = [];
  List<DaftarPesanan> get daftar => [...data];

  void tambahPesanan(DaftarPesanan item) {
    data.add(item);
    myState = MyState.loaded;
    notifyListeners();
  }

  void hapusPesanan(index) {
    data.remove(index);
    myState = MyState.loaded;
    notifyListeners();
  }

  MyState myState2 = MyState.initial;
  Future ambilPesanan() async {
    myState2 = MyState.loading;
    notifyListeners();

    try {
      pesanan = await _servicePesanan.getPesanan();

      myState2 = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState2 = MyState.failed;
      notifyListeners();
    }
  }
}
