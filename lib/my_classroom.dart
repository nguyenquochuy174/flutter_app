import 'dart:math';

import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  Color getColor(String color) {
    switch (color.toLowerCase()) {
      case 'black':
        return Colors.black;
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lớp học của tôi", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(child: myBody()),
    );
  }
  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(20, (index) => item()),
    );
  }
  Widget item([Color? color]) {
    final randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Container(
      height: 130,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? randomColor,
        borderRadius: BorderRadius.circular(10),
      ),
     child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          block1Left(),
          block1Right(),
        ],
      ),
    );
  }
  Widget block1Left() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        block1LeftTop(),
        block1LeftBottom(),
      ],
    );
  }
  Widget block1LeftTop() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Text(
              "Lập trình ứng dụng cho các thiết bị di động", 
              style: TextStyle(fontSize: 25, color: Colors.white), 
              overflow: TextOverflow.ellipsis, maxLines: 1,
            )
          ),
          Text("2025-2026.1.TIN4583.001", style: TextStyle(color: Colors.white),),
        ],
    );
  }
  Widget block1LeftBottom() {
    return Text("50 học viên", style: TextStyle(color: Colors.white),);
  }
  Widget block1Right() {
    return Row(
      children: [
        IconButton(onPressed: (){
          print("Ok rồi đấy!!!!");
        }, icon: Icon(Icons.more_horiz, color: Colors.white,),),
      ],
    );
  }  
}