class ModelCustomer {
  String? id;
  String name;
  String number;

  ModelCustomer({this.id, required this.name, required this.number});

  // ModelCustomer.fromJson(Map<dynamic, dynamic> json)
  //     : name = json['nama'].toString(),
  //       number = json['nomor'].toString();

  factory ModelCustomer.fromJson(Map<String, dynamic> json) => ModelCustomer(
        id: json['key'],
        name: json['nama'].toString(),
        number: json['nomor'].toString(),
      );

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'nama': name,
        'nomor': number,
      };
}
