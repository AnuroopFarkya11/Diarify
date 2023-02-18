
import 'package:get/get.dart';

import 'controller.dart';

class NotionEditingBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => NotionEditingController());
  }

}