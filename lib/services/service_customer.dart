// import 'package:cafe_sederhana/models/model_customer.dart';
// import 'package:dio/dio.dart';

// class ServiceCustomer {
//   late Dio _dio;
//   final url =
//       "https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app/customer.json";

//   ServiceCustomer() {
//     _dio = Dio();
//   }

//   Future<List<ModelCustomer>> getCustomer() async {
//     final response = await _dio.get(url);
//     print(response);

//     if (response.data != null) {
//       return List<ModelCustomer>.from(
//         response.data.map((e) => ModelCustomer.fromJson(e)).toList(),
//       );
//     }
//     return [];
//   }
// }
