import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:intl/intl.dart';

import 'Article.dart';
import 'Sources.dart';
import 'Styles.dart';

class ArticleView {

  static ListTile getView(Article article) {
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(article.title, style: Styles.FONT_TITLE),
        subtitle: getDescription(article),
        trailing: new Image.network(
          article.thumbnail,
          fit: BoxFit.cover,
          height: 65,
          width: 65,
        ),
        onTap: () => _onTapped(article));
  }

  static Text getDescription(Article article) {
      return Text(article.description + "\n\nLe "
      + DateFormat("dd/MM/yyyy à H:mm").format(article.publishedAt.toLocal())
      + " via " + Sources.fromId(article.source),
      textAlign: TextAlign.justify);
  }

  static _onTapped(Article article) async {
    try {
      await launch(article.url, option: Styles.TABS_OPTIONS);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
