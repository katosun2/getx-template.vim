import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class @nameView extends StatefulWidget {
  @override
  _@nameViewState createState() => _@nameViewState();
}

class _@nameViewState extends State<@nameView> {
  final @nameLogic logic = Get.put(@nameLogic());

  @override

  void dispose() {
    Get.delete<@nameLogic>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<@nameLogic>(builder: (logic) {
      return Container();
    };
  }
}
