class ModelMakanan {
  int? id;
  String name;
  String price;
  String image;
  int? qty;

  ModelMakanan({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.qty,
  });

  factory ModelMakanan.fromJson(Map<String, dynamic> json) => ModelMakanan(
        id: json["id"],
        name: json["nama"].toString(),
        image: json["gambar"].toString(),
        price: json["harga"].toString(),
        qty: json["jumlah"],
      );

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id,
        'nama': name,
        'harga': price,
        'jumlah': qty,
      };
}
