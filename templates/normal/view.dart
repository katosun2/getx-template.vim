import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class @nameView extends StatefulWidget {
  @override
  _@nameViewState createState() => _@nameViewState();
}

class _@nameViewState extends State<@nameView> {
  final @nameLogic logic = Get.put(@nameLogic());
  final @nameState state = Get.find<@nameLogic>().state;

  @override
  void initState() {
    super.initState();
  }

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
