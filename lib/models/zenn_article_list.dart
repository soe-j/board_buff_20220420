import 'package:board_buff_20220420/models/zenn_article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_article_list.freezed.dart';

part 'zenn_article_list.g.dart';

@freezed
class ZennArticleList with _$ZennArticleList {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ZennArticleList(
      {required List<ZennArticle> articles,
      required int nextPage}) = _ZennArticleList;

  factory ZennArticleList.fromJson(Map<String, dynamic> json) =>
      _$ZennArticleListFromJson(json);
}
