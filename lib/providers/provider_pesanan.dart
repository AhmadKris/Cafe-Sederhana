import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class ProviderPesanan with ChangeNotifier {
  final DatabaseReference _customer =
      FirebaseDatabase.instance.ref().child('pesanan/');

  void saveOrder(m) {
    _customer.push().set(m);

    // print(customer.name);
  }

  // late ServicePesanan _servicePesanan;
  // List<ModelPesanan> _list = [];

  // ProviderPesanan() {
  //   _servicePesanan = ServicePesanan();
  //   _fetchData();
  // }

  // void _fetchData() async {
  //   _list = await _servicePesanan.getData();
  // }

  // List<ModelPesanan> get listPesanan => [..._list];
}
