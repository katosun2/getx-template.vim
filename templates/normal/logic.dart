import 'package:get/get.dart';

import 'state.dart';

class @nameLogic extends GetxController {
  final state = @nameState();

  // 暴露给view来刷新
  void updateView() {
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    //var map = Get.arguments;
    //msg = map['msg'];
    //update();
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
