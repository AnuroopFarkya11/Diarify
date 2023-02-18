import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_model.freezed.dart';
part 'notion_model.g.dart';

@freezed
class NotionModel with _$NotionModel{

  const factory NotionModel({
    required String notionId,
    required String userId,
    required String title,
    required String notionContent,
    required DateTime dateTime,
  }) = _NotionModel;

  factory NotionModel.fromJson(Map<String, Object?> json) => _$NotionModelFromJson(json);
}
