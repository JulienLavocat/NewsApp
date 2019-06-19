import "package:flutter/material.dart";
import 'package:news/Article.dart';
import "package:news/API.dart";
import 'package:news/ArticleView.dart';

import 'Sources.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsListState();
}

class NewsListState extends State<NewsList> {
  ScrollController _scrollController;

  final titleFont = TextStyle(fontSize: 18.0);
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorState =
      new GlobalKey<RefreshIndicatorState>();

  List<Article> _articles = List();
  var isLoading = false;
  var fetchedData = false;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListenner);
  }

  _fetchData() async {
    setLoadingState(true);

    try {
      await Sources.fetchSources();

      _articles.clear();
      _articles = await API.getLatest();
    } catch (e) {
      setLoadingState(false);
      setDataLoaded();
    }

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
    return RefreshIndicator(
        key: _refreshIndicatorState,
        onRefresh: _refreshList,
        child: ListView.separated(
          controller: _scrollController,
          separatorBuilder: (context, index) => Divider(),
          itemCount: _articles.length,
          itemBuilder: _buildNewsList,
        ));
  }

  Widget _buildNewsList(BuildContext context, int i) {
    return ArticleView.getView(_articles[i]);
  }

  Future<Null> _refreshList() {
    return _fetchData();
  }

  _scrollListenner() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
            _loadMore();
        }
  }

  _loadMore() async {
    final result = await API.fetch(_articles.length);
    setState(() {
     _articles.addAll(result);
    });
  }
}
