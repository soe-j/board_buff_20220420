import 'dart:convert' as convert;

import 'package:board_buff_20220420/models/zenn_article_list.dart';
import 'package:http/http.dart' as http;

class ZennApiClient {
  static const host = 'zenn.dev';
  static const basePath = '/api';

  Future<ZennArticleList> getArticleList(Map<String, String> params) async {
    final response = await http.get(
      Uri.https(host, '$basePath/articles', params),
    );
    final json = convert.jsonDecode(response.body);
    return ZennArticleList.fromJson(json);
  }
}
