import 'package:flutter/material.dart';

class ColorChangeTab extends StatelessWidget {
  final Function clickListener;
  final double textSize;
  final TextEditingController controller;

  ColorChangeTab(this.clickListener, this.controller, this.textSize);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        clickListener();
      },
      child: Center(
        child: Text(controller.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
