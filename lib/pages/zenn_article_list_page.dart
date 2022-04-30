import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_20220420/blocs/zenn_articles_bloc.dart';
import 'package:board_buff_20220420/models/zenn_article.dart';
import 'package:flutter/material.dart';

class ZennArticleListPage extends StatefulWidget {
  const ZennArticleListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ZennArticleListPageState();
  }
}

class _ZennArticleListPageState extends State<ZennArticleListPage> {
  late ZennArticlesBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<ZennArticlesBloc>(context);
    _bloc.fetchArticleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('記事一覧')),
        body: StreamBuilder<List<ZennArticle>>(
          stream: _bloc.articleListStream,
          builder: (context, snapshot) {
            final articles = snapshot.data ?? [];

            return ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, thickness: 1),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  leading:
                      Text(article.emoji, style: const TextStyle(fontSize: 24)),
                  title: Text(article.title,
                      style: const TextStyle(color: Colors.black87)),
                  subtitle: Text(article.publishedAt.toIso8601String()),
                );
              },
            );
          },
        ));
  }
}
