import "package:flutter/material.dart";
import 'package:news/Article.dart';
import "package:news/API.dart";
import 'package:news/ArticleView.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsListState();
}

class NewsListState extends State<NewsList> {
  final titleFont = TextStyle(fontSize: 18.0);

  List<Article> _articles = List();
  var isLoading = false;
  var fetchedData = false;

  _fetchData() async {
    setLoadingState(true);

    _articles.clear();
    _articles = await API.getLatest();

    setLoadingState(false);
    setDataLoaded();
  }

  setLoadingState(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  setDataLoaded() {
    setState(() {
      fetchedData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!fetchedData) _fetchData();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Actualités")),
      ),
      body: isLoading ? getLoadingBody() : getNewsBody(context),
    );
  }

  Widget getLoadingBody() {
    return Center(child: CircularProgressIndicator());
  }

  Widget getNewsBody(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: _articles.length,
      itemBuilder: _buildNewsList,
    );
  }

  Widget _buildNewsList(BuildContext context, int i) {
    return ArticleView.getView(_articles[i]);
  }
}
