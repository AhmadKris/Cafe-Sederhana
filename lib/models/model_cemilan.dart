class ModelCemilan {
  int? id;
  String name;
  String price;
  String image;

  ModelCemilan({
    this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory ModelCemilan.fromJson(Map<String, dynamic> json) => ModelCemilan(
        name: json["nama"].toString(),
        price: json["harga"].toString(),
        image: json["gambar"].toString(),
      );
}
