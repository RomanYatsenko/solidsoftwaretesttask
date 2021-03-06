import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:solidsoftwaretask/color_change_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String appBarTitle = 'Solid software test task';
  final String middleText = 'Hey there';
  double textSize = 20;
  TextEditingController controller = TextEditingController();
  Color bgColor = Colors.white;

  _MainPageState() {
    controller.text = middleText;
  }

  void upDateBgColor() {
    setState(() {
      bgColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(appBarTitle),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Main'),
                  Tab(text: 'Text change'),
                  Tab(text: 'Text size'),
                ],
              ),
            ),
            body: Container(
                color: bgColor,
                child: TabBarView(children: [
                  ColorChangeTab(upDateBgColor, controller, textSize),
                  Center(
                      child: Container(
                          width: 300,
                          child: TextField(
                            controller: controller,
                          ))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Text size: ${textSize.round()}'),
                      Slider(
                        value: textSize,
                        min: 10,
                        max: 50,
                        onChanged: (value) {
                          setState(() {
                            textSize = value;
                          });
                        },
                      )
                    ],
                  )
                ]))));
  }
}
