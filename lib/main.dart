import 'package:flutter/material.dart';
import 'package:news/NewsList.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "NewsApp",
        home: NewsList()
    );
  }

}
