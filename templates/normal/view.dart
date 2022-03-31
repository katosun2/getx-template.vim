import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class @namePage extends StatefulWidget {
  @override
  _@namePageState createState() => _@namePageState();
}

class _@namePageState extends State<@namePage> {
  final @nameLogic logic = Get.put(@nameLogic());
  final @nameState state = Get.find<@nameLogic>().state;

  @override
  void dispose() {
    // 自动回收
    Get.delete<@nameLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<@nameLogic>(builder: (logic) {
      return Container();
    });
  }
}
