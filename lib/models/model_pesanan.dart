class PesananModel {
  String? namaCustomer;
  String? nomorMeja;
  List<DaftarPesanan>? daftarPesanan;

  PesananModel({this.namaCustomer, this.nomorMeja, this.daftarPesanan});

  PesananModel.fromJson(Map<String, dynamic> json) {
    namaCustomer = json['nama_customer'];
    nomorMeja = json['nomor_meja'];
    if (json['daftar_pesanan'] != null) {
      daftarPesanan = <DaftarPesanan>[];
      json['daftar_pesanan'].forEach((v) {
        daftarPesanan!.add(DaftarPesanan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_customer'] = namaCustomer;
    data['nomor_meja'] = nomorMeja;
    if (daftarPesanan != null) {
      data['daftar_pesanan'] = daftarPesanan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DaftarPesanan {
  int? harga;
  int? jumlah;
  String? kategori;
  String? nama;

  DaftarPesanan({this.harga, this.jumlah, this.kategori, this.nama});

  DaftarPesanan.fromJson(Map<String, dynamic> json) {
    harga = json['harga'];
    jumlah = json['jumlah'];
    kategori = json['kategori'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['harga'] = harga;
    data['jumlah'] = jumlah;
    data['kategori'] = kategori;
    data['nama'] = nama;
    return data;
  }
}
