// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotionModel _$$_NotionModelFromJson(Map<String, dynamic> json) =>
    _$_NotionModel(
      notionId: json['notionId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      notionContent: json['notionContent'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_NotionModelToJson(_$_NotionModel instance) =>
    <String, dynamic>{
      'notionId': instance.notionId,
      'userId': instance.userId,
      'title': instance.title,
      'notionContent': instance.notionContent,
      'dateTime': instance.dateTime.toIso8601String(),
    };
