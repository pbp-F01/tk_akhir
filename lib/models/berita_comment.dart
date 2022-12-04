// // To parse this JSON data, do
// //
// //     final commentModel = commentModelFromJson(jsonString);

// import 'dart:convert';

// List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

// String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CommentModel {
//     CommentModel({
//         this.model,
//         this.pk,
//         this.fields,
//     });

//     Model model;
//     int pk;
//     Fields fields;

//     factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
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
//         this.commentsSubstance,
//         this.user,
//         this.news,
//         this.dateAdded,
//     });

//     String commentsSubstance;
//     int user;
//     int news;
//     DateTime dateAdded;

//     factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         commentsSubstance: json["comments_substance"],
//         user: json["user"],
//         news: json["news"],
//         dateAdded: DateTime.parse(json["date_added"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "comments_substance": commentsSubstance,
//         "user": user,
//         "news": news,
//         "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
//     };
// }
