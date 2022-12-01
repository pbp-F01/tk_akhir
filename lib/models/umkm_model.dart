class UmkmModel {
  String? model;
  int? pk;
  Fields? fields;

  UmkmModel({this.model, this.pk, this.fields});

  UmkmModel.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
    json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  String? nama;
  String? pemilik;
  String? noTelepon;
  String? email;
  String? kontak;
  String? kota;
  String? provinsi;
  int? kodepos;
  String? foto;
  String? tanggalPembuatan;

  Fields(
      {this.nama,
        this.pemilik,
        this.noTelepon,
        this.email,
        this.kontak,
        this.kota,
        this.provinsi,
        this.kodepos,
        this.foto,
        this.tanggalPembuatan});

  Fields.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    pemilik = json['pemilik'];
    noTelepon = json['no_telepon'];
    email = json['email'];
    kontak = json['kontak'];
    kota = json['kota'];
    provinsi = json['provinsi'];
    kodepos = json['kodepos'];
    foto = json['foto'];
    tanggalPembuatan = json['tanggal_pembuatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['pemilik'] = this.pemilik;
    data['no_telepon'] = this.noTelepon;
    data['email'] = this.email;
    data['kontak'] = this.kontak;
    data['kota'] = this.kota;
    data['provinsi'] = this.provinsi;
    data['kodepos'] = this.kodepos;
    data['foto'] = this.foto;
    data['tanggal_pembuatan'] = this.tanggalPembuatan;
    return data;
  }
}
