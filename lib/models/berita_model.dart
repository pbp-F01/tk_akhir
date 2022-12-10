import 'dart:convert';

List<NewsModel> NewsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String NewsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
    int? pk;
    Fields? fields;
    String? model;
    
    NewsModel({
        this.model,
        this.pk,
        this.fields,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields!.toJson(),
    };
}

class Fields {
    String? newsTitle;
    String? newsBody;
    String? newsSource;
    String? newsImage; 
    String? newsPublished;
    
    Fields({
        this.newsTitle,
        this.newsBody,
        this.newsSource,
        this.newsImage,
        this.newsPublished,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        newsTitle: json["news_title"],
        newsBody: json["news_body"],
        newsSource: json["news_source"],
        newsImage: json["news_image"],
        newsPublished: json["news_published"],
    );

    Map<String, dynamic> toJson() => {
        "news_title": newsTitle,
        "news_body": newsBody,
        "news_source": newsSource,
        "news_image": newsImage,
        "news_published": newsPublished,
    };
}