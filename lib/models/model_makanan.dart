class ModelMakanan {
  int? id;
  String name;
  String price;
  String image;

  ModelMakanan({
    this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory ModelMakanan.fromJson(Map<String, dynamic> json) => ModelMakanan(
      id: json["id"],
      name: json["nama"].toString(),
      image: json["gambar"].toString(),
      price: json["harga"].toString());
}
