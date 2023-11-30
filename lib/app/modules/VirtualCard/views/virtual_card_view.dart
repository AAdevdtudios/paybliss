import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybliss/main.dart';

import '../controllers/virtual_card_controller.dart';
import 'empty_card_view.dart';

class VirtualCardView extends GetView<VirtualCardController> {
  const VirtualCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return box.read('card') == null
        ? const EmptyCardView()
        : SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(),
            ),
          );
  }
}
