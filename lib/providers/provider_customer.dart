import 'package:cafe_sederhana/models/model_customer.dart';
import 'package:cafe_sederhana/services/service_customer.dart';
import 'package:cafe_sederhana/utils/finite_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ProviderCustomer extends ChangeNotifier {
  final ServiceCustomer _serviceCustomer = ServiceCustomer();
  ModelCustomer? usr;
  ModelCustomer? user;

  MyState myState = MyState.initial;
  Future addUser(ModelCustomer data) async {
    myState = MyState.loading;
    notifyListeners();
    try {
      usr = await _serviceCustomer.postUser(data);

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

  MyState myState2 = MyState.initial;
  Future getUser() async {
    myState2 = MyState.loading;
    notifyListeners();
    try {
      user = await _serviceCustomer.getUser();

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
