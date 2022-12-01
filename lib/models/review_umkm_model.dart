class ReviewUmkmModel {
  List<Data>? data;

  ReviewUmkmModel({this.data});

  ReviewUmkmModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Fields? fields;

  Data({this.fields});

  Data.fromJson(Map<String, dynamic> json) {
    fields =
    json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  String? namaUmkm;
  String? logo;
  String? deskripsi;
  int? umkm;
  int? rating;

  Fields({this.namaUmkm, this.logo, this.deskripsi, this.umkm, this.rating});

  Fields.fromJson(Map<String, dynamic> json) {
    namaUmkm = json['nama_umkm'];
    logo = json['logo'];
    deskripsi = json['deskripsi'];
    umkm = json['umkm'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_umkm'] = this.namaUmkm;
    data['logo'] = this.logo;
    data['deskripsi'] = this.deskripsi;
    data['umkm'] = this.umkm;
    data['rating'] = this.rating;
    return data;
  }
}
