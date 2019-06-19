import "dart:convert";

import "package:http/http.dart" as http;
import 'package:http/http.dart';

import "Article.dart";

class API {
  static final _latestUrl = "https://news.thebad.xyz/latest";
  static final _fetchUrl = "https://news.thebad.xyz/from";
  static final _defaultImgUrl = "https://news.thebad.xyz/defaultImage.jpg";
  static final _sources = "https://news.thebad.xyz/sources";

  static Future<List<Article>> getLatest() async {
    final result = await http.get(_latestUrl);
    if (result.statusCode != 200)
      return List();
    else
      return _parseResponse(result);
  }

  static Future<List<Article>> fetch(int from) async {
    final result = await http.get(_fetchUrl + "?from=" + from.toString());

    if (result.statusCode != 200)
      return List();
    else
      return _parseResponse(result);
  }

  static Future<Map> getSources() async {
    final result = await http.get(_sources);

    Map sources = Map();

    if (result.statusCode != 200) return sources;

    sources = (json.decode(result.body) as Map);

    return sources;
  }

  static List<Article> _parseResponse(Response response) {
    List<Article> list = List();

    if (response.statusCode != 200) return list;

    list = (json.decode(response.body) as List)
        .map((data) => Article.fromJson(data))
        .toList();

    return list;
  }

  static String defaultImage() {
    return _defaultImgUrl;
  }
}
