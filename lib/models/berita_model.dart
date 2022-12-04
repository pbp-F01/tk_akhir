// // To parse this JSON data, do
// //
// //     final beritaModel = beritaModelFromJson(jsonString);

// import 'dart:convert';

// List<BeritaModel> beritaModelFromJson(String str) => List<BeritaModel>.from(json.decode(str).map((x) => BeritaModel.fromJson(x)));

// String beritaModelToJson(List<BeritaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class BeritaModel {
//      Model model;
//     int pk;
//     Fields fields;
    
//     BeritaModel({
//         this.model,
//         this.pk,
//         this.fields,
//     });

   

//     factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
//         model: modelValues.map[json["model"]],
//         pk: json["pk"],
//         fields: Fields.fromJson(json["fields"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "model": modelValues.reverse[model],
//         "pk": pk,
//         "fields": fields.toJson(),
//     };
// }

// class Fields {
//     Fields({
//         this.newsTitle,
//         this.newsBody,
//         this.newsSource,
//         this.newsImage,
//         this.newsPublished,
//     });

//     String newsTitle;
//     String newsBody;
//     String newsSource;
//     String newsImage;
//     String newsPublished;

//     factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         newsTitle: json["news_title"],
//         newsBody: json["news_body"],
//         newsSource: json["news_source"],
//         newsImage: json["news_image"],
//         newsPublished: json["news_published"],
//     );

//     Map<String, dynamic> toJson() => {
//         "news_title": newsTitle,
//         "news_body": newsBody,
//         "news_source": newsSource,
//         "news_image": newsImage,
//         "news_published": newsPublished,
//     };
// }
