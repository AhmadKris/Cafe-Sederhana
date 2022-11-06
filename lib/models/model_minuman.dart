class ModelMinuman {
  int? id;
  String name;
  String price;
  String image;
  int? qty;

  ModelMinuman({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.qty,
  });

  factory ModelMinuman.fromJson(Map<String, dynamic> json) => ModelMinuman(
        id: json["id"],
        name: json["nama"].toString(),
        price: json["harga"].toString(),
        image: json["gambar"].toString(),
        qty: json["jumlah"],
      );
}
