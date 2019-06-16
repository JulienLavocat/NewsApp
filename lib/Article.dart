import "package:flutter/material.dart";
import "Viewer.dart";
import "API.dart";
import "Styles.dart";

class Article {
  final String title;
  final String description;
  final String image;
  final String url;

  Article({this.title, this.description, this.image, this.url});

  factory Article.fromJson(Map<String, dynamic> json) {
    final imgUrl =
        json["urlToImage"] != null ? json["urlToImage"] : API.defaultImage();

    return Article(
        description: json["description"],
        image: imgUrl,
        title: json["title"],
        url: json["url"]);
  }

  static ListTile getView(Article article) {

    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      title: Text(article.title, style: Styles.FONT_TITLE),
      subtitle: Text(article.description),
      trailing: new Image.network(
        article.image,
        fit: BoxFit.cover,
        height: 65,
        width: 65,
      ),
      onTap: () => onTapped(article)
    );
  }

    static onTapped(Article article) {
        
    }

}
