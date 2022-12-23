class MenuModel {
  String? gambar;
  int? harga;
  int? jumlah;
  String? kategori;
  String? nama;

  MenuModel({this.gambar, this.harga, this.jumlah, this.kategori, this.nama});

  MenuModel.fromJson(Map<String, dynamic> json) {
    gambar = json["gambar"];
    harga = json["harga"];
    jumlah = json["jumlah"];
    kategori = json["kategori"];
    nama = json["nama"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gambar'] = gambar;
    data['harga'] = harga;
    data['jumlah'] = jumlah;
    data['kategori'] = kategori;
    data['nama'] = nama;
    return data;
  }
}
