import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_article.freezed.dart';

part 'zenn_article.g.dart';

@freezed
class ZennArticle with _$ZennArticle {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ZennArticle({
    required int id,
    required String title,
    required String emoji,
    required int likedCount,
    required DateTime publishedAt,
  }) = _ZennArticle;

  factory ZennArticle.fromJson(Map<String, dynamic> json) =>
      _$ZennArticleFromJson(json);
}
