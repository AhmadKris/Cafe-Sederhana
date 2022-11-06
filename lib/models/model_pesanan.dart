import 'package:cafe_sederhana/models/model_items.dart';

class ModelPesanan {
  String? id;
  String name;
  String number;
  List<Items>? item;

  ModelPesanan({
    this.id,
    required this.name,
    required this.number,
    this.item,
  });

  factory ModelPesanan.fromJson(Map<String, dynamic> json) => ModelPesanan(
        id: json["key"],
        name: json["customer"],
        number: json["nomor meja"],
        // item: json["item"] == null
        //     ? []
        //     : Items.toOrderItemList(
        //         json['items'],
        //       ),
      );

  // Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  //       'id': id,
  //       'nama': name,
  //       'nomor meja': number,
  //       'item': item,
  //     };
}
