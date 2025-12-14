import 'dart:math';

import 'package:flutter/material.dart';

class MyChangeColorApp extends StatefulWidget {
  const MyChangeColorApp({super.key});

  @override
  _MyChangeColorAppState createState() => _MyChangeColorAppState();
}

class _MyChangeColorAppState extends State<MyChangeColorApp> {
  Color bgColor = Colors.purple;
  String bgColorChange = "Tím";
  List<Color> listColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];
  List<String> colorNames = [
    "Đỏ",
    "Xanh dương",
    "Xanh lá",
    "Vàng",
    "Cam",
    "Tím",
    "Hồng",
  ];
  _changeColor() {
    var rand = Random();
    var numberRandom = rand.nextInt(listColors.length);
    setState(() {
      bgColor = listColors[numberRandom];
      bgColorChange = colorNames[numberRandom];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ứng dụng đổi màu nền",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(child: myBody()),
    );
  }

  Widget myBody() {
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Màu hiện tại",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            bgColorChange,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _changeColor();
                },
                child: Text("Đổi màu"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = Colors.purple;
                  });
                },
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
