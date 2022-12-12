class SellingModel {
  int? pk;
  Fields? fields;
  String? model;

  SellingModel({
    this.model,
    this.pk,
    this.fields,
  });

  SellingModel.fromJson(Map<String, dynamic> json) {
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
  String? tanggal;
  int? jumlahTerjual;
  int? revenue;

  Fields({
    this.nama,
    this.tanggal,
    this.jumlahTerjual,
    this.revenue,
  });

  Fields.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    tanggal = json['tanggal'];
    jumlahTerjual = json['jumlah_terjual'];
    revenue = json['revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['tanggal'] = this.tanggal;
    data['jumlah_terjual'] = this.jumlahTerjual;
    data['revenue'] = this.revenue;

    return data;
  }
}
