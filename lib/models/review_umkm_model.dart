class ReviewUmkmModel {
  String? model;
  int? pk;
  Fields? fields;

  ReviewUmkmModel({this.model, this.pk, this.fields});

  ReviewUmkmModel.fromJson(Map<String, dynamic> json) {
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
  int? author;
  String? reviewDate;
  int? rating;
  String? comment;
  int? umkm;

  Fields({this.author, this.reviewDate, this.rating, this.comment, this.umkm});

  Fields.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    reviewDate = json['review_date'];
    rating = json['rating'];
    comment = json['comment'];
    umkm = json['umkm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['review_date'] = this.reviewDate;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['umkm'] = this.umkm;
    return data;
  }
}
