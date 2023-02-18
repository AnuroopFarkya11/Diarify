import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentimental_model.freezed.dart';
part 'sentimental_model.g.dart';

@freezed
class SentimentalModel with _$SentimentalModel{

  const factory SentimentalModel({
    required String sentiment,
    required String score,
  }) = _SentimentalModel;

  factory SentimentalModel.fromJson(Map<String, Object?> json) => _$SentimentalModelFromJson(json);
}

@freezed
class SendingTextModel with _$SendingTextModel{

  const factory SendingTextModel({
    required String sentiment,
    required String score,
  }) = _SendingTextModel;

  factory SendingTextModel.fromJson(Map<String, Object?> json) => _$SendingTextModelFromJson(json);
}
