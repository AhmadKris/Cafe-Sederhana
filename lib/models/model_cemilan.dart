class ModelCemilan {
  int? id;
  String name;
  String price;
  String image;
  int? qty;

  ModelCemilan({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.qty,
  });

  factory ModelCemilan.fromJson(Map<String, dynamic> json) => ModelCemilan(
        id: json["id"],
        name: json["nama"].toString(),
        price: json["harga"].toString(),
        image: json["gambar"].toString(),
        qty: json["jumlah"],
      );
}
