class ModelMinuman {
  int? id;
  String name;
  String price;
  String image;

  ModelMinuman({
    this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory ModelMinuman.fromJson(Map<String, dynamic> json) => ModelMinuman(
        name: json["nama"].toString(),
        price: json["harga"].toString(),
        image: json["gambar"].toString(),
      );
}
