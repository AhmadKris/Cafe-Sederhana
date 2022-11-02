import 'package:cafe_sederhana/models/model_cemilan.dart';
import 'package:cafe_sederhana/services/service_cemilan.dart';
import 'package:flutter/foundation.dart';

class ProviderCemilan with ChangeNotifier {
  late ServiceCemilan _serviceCemilan;
  List<ModelCemilan> _list = [];

  ProviderCemilan() {
    _serviceCemilan = ServiceCemilan();
    _fetchDataSnacks();
  }

  void _fetchDataSnacks() async {
    _list = await _serviceCemilan.getAllSnacks();
  }

  List<ModelCemilan> get list => [..._list];
}
