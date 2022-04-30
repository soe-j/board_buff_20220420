import 'package:board_buff_20220420/clients/zenn_api_client.dart';
import 'package:board_buff_20220420/models/zenn_article_list.dart';

class ZennRepository {
  final ZennApiClient _apiClient = ZennApiClient();

  Future<ZennArticleList> getArticleList() async {
    return await _apiClient.getArticleList(
        {'order': 'daily', 'topicname': 'flutter', 'count': '10', 'page': '1'});
  }
}
