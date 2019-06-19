import "package:flutter/material.dart";
import "package:flutter_custom_tabs/flutter_custom_tabs.dart";
import "API.dart";
import "Styles.dart";

class Article {
  final String title;
  final String description;
  final String thumbnail;
  final String url;
  final String source;
  final DateTime publishedAt;

  Article({this.title, this.description, this.thumbnail, this.url, this.source,this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        description: json["description"],
        thumbnail: json["thumbnail"] != null ? json["thumbnail"] : API.defaultImage(),
        title: json["title"],
        url: json["url"],
        source: json["source"],
        publishedAt: DateTime.parse(json["publishedAt"]));
  }

}
