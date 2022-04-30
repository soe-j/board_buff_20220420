import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_20220420/models/zenn_article.dart';
import 'package:board_buff_20220420/repositories/zenn_repository.dart';
import 'package:rxdart/rxdart.dart';

class ZennArticlesBloc implements Bloc {
  final _zennRepository = ZennRepository();

  final _articleList = BehaviorSubject<List<ZennArticle>>.seeded([]);

  Stream<List<ZennArticle>> get articleListStream => _articleList.stream;

  Future<void> fetchArticleList() async {
    final articleList = await _zennRepository.getArticleList();
    _articleList.add(articleList.articles);
  }

  @override
  void dispose() {
    _articleList;
  }
}
