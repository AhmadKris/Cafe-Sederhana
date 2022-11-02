import 'package:flutter/cupertino.dart';

class ModelPesanan {
  int? id;
  String name;
  String qty;

  ModelPesanan({this.id, required this.name, required this.qty});

  factory ModelPesanan.fromJson(Map<String, dynamic> json) => ModelPesanan(
        name: json["nama"],
        qty: json["jumlah"],
      );
}
