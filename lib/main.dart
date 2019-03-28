import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  final String appBarTitle = 'Solid software test task';
  Color bgColor = Colors.white;
  String _middleText = 'Hey there';

  String get middleText => _middleText;

  set middleText(String newMiddleText) {
    if (newMiddleText != null && newMiddleText.trim().isNotEmpty) {
      _middleText = newMiddleText;
    }
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void upDateBgColor(Color color) {
    setState(() {
      widget.bgColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle),
        ),
        body: GestureDetector(
          onTap: () {
            upDateBgColor(
                Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                    .withOpacity(1.0));
          },
          child: Container(
            color: widget.bgColor,
            child: Center(
                child: Text(widget.middleText,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          ),
        ));
  }
}
