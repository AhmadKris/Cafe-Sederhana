import 'package:cafe_sederhana/models/model_pesanan.dart';
import 'package:dio/dio.dart';

class ServicePesanan {
  late Dio _dio;
  final url =
      "https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app";

  ServicePesanan() {
    _dio = Dio();
  }

  // Future<List<ModelPesanan>> getData() async {
  //   List<ModelPesanan> order = [];
  //   final response = await _dio.get('$url/pesanan.json');
  //   print(response);
  //   final extractedData = response.data as Map<String, dynamic>;
  //   if (extractedData.isEmpty) {
  //     return [];
  //   }
  //   extractedData.forEach((key, value) {
  //     order.add(
  //       ModelPesanan(
  //         id: key,
  //         name: value['customer'],
  //         number: value['nomor meja'],
  //       ),
  //     );
  //   });
  //   return order;
  // }

  // Future<List<ModelPesanan>> getDataItems() async {
  //   List<ModelPesanan> order = [];
  //   final response = await _dio.get('$url/pesanan/items.json');
  //   print(response);
  //   final extractedData = response.data as Map<String, dynamic>;
  //   if (extractedData.isEmpty) {
  //     return [];
  //   }
  //   extractedData.forEach((key, value) {
  //     order.add(ModelPesanan(
  //         id: key, name: value['nama'], number: value['nomor meja'], item: []));
  //   });
  //   return order;
  // }
}
