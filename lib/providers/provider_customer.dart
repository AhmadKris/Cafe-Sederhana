import 'package:cafe_sederhana/models/model_customer.dart';
import 'package:cafe_sederhana/services/service_customer.dart';
// import 'package:cafe_sederhana/services/service_customer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class ProviderCustomer with ChangeNotifier {
  final DatabaseReference _customer =
      FirebaseDatabase.instance.ref().child('customer');

  void saveCustomer(ModelCustomer customer) {
    _customer.push().set(customer.toJson());
    // print(customer.name);
  }

  late ServiceCustomer _serviceCustomer;
  List<ModelCustomer> _users = [];

  List<ModelCustomer> get user => [..._users];

  ProviderCustomer() {
    _serviceCustomer = ServiceCustomer();
    _fetchDataUsers();
  }

  void _fetchDataUsers() async {
    _users = await _serviceCustomer.getCustomer();
  }
}

  

//   late ServiceCustomer _serviceCustomer;
//   List<ModelCustomer> _users = [];

  

//   List<ModelCustomer> get users => [..._users];

