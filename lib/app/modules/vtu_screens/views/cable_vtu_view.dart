import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CableVtuView extends GetView {
  const CableVtuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CableTv'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          DropdownButton(
            items: const [
              DropdownMenuItem(
                value: "hello",
                child: Text("Hello"),
              ),
              DropdownMenuItem(
                value: "special",
                child: Text("Special"),
              ),
            ],
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}
