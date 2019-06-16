import "package:flutter/material.dart";
import "package:flutter_custom_tabs/flutter_custom_tabs.dart";
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
      onTap: () => _onTapped(article)
    );
  }

    static _onTapped(Article article) async {
        try {
            await launch(article.url, option: Styles.TABS_OPTIONS);
        } catch (e) {
            debugPrint(e.toString());
        }
    }

}
