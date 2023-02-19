
import 'package:get/get.dart';

import '../../../models/notion_model/notion_model.dart';
import '../../../models/sentimental_model/sentimental_model.dart';

class NotionEditingState{
  Rx<SentimentalModel> sentimentalData = const SentimentalModel(
    sentiment: '',
    score: '64.4646',
  ).obs;

  Rx<NotionModel> notionToUpload = NotionModel(
    dateTime: DateTime.now(),
    notionContent: '',
    notionId: '',
    title: '',
    userId: ''
  ).obs;
}