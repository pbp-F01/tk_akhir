import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
    CommentModel({
        //this.model,
        this.pk,
        this.fieldsComments,
    });

    //String? model;
    int? pk;
    FieldsComments? fieldsComments;

    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        //model: json["model"],
        pk: json["pk"],
        fieldsComments: FieldsComments.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        // "model": model,
        "pk": pk,
        "fields": fieldsComments!.toJson(),
    };
}

class FieldsComments {
    FieldsComments({
        this.commentsSubstance,
        this.user,
        this.news,
        this.dateAdded,
    });

    String? commentsSubstance;
    String? user;
    int? news;
    String? dateAdded;

    factory FieldsComments.fromJson(Map<String, dynamic> json) => FieldsComments(
        commentsSubstance: json["comments_substance"],
        user: json["user"],
        news: json["news"],
        dateAdded: json["date_added"],
    );

    Map<String, dynamic> toJson() => {
        "comments_substance": commentsSubstance,
        "user": user,
        "news": news,
        "date_added": dateAdded,
    };
}

