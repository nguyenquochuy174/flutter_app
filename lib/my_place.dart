import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Địa điểm của tôi", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            block1(),
            block2(),
            block3(),
            block4(),
          ],
        ),
      ),
    );
  }
  Widget block1() {
    var src ="https://images.unsplash.com/photo-1559586616-361e18714958?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Image.network(src);
  }
  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          blockChild21(),
          blockChild22(),
        ],
      ),
    );
  }
  blockChild21() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Oeschinen Lake Campground", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),
        Text("Kandersteg, Switzerland", style: TextStyle(color: Colors.grey),),
      ],
    );
  }
  blockChild22() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.red,),
        Text("41"),
      ],
    );
  }
  block3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        blockChild31(),
        blockChild32(),
        blockChild33(),
      ],
    );
  }
  blockChild31() {
    return Column(
      children: [
        Icon(Icons.call, color: Colors.blue,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("CALL", style: TextStyle(color: Colors.blue),),
        ),
      ],
    );
  }
  blockChild32() {
    return Column(
      children: [
        Icon(Icons.near_me, color: Colors.blue,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("ROUTE", style: TextStyle(color: Colors.blue),),
        ),
      ],
    );
  }
  blockChild33() {
    return Column(
      children: [
        Icon(Icons.share, color: Colors.blue,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("SHARE", style: TextStyle(color: Colors.blue),),
        ),
      ],
    );
  }
  block4() {
    var data = "Xin chào mọi người, hôm nay mình bắt đầu học lập trình ứng dụng di động cho các thiết bị di động. Nếu có khó khăn gì thì mọi người giúp mình với nhé. Mình cảm ơn nhiều lắm luôn đó. Chúc mọi người một ngày tốt lành và tràn đầy năng lượng.";
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Text(data, style: TextStyle(fontSize: 18, ),),
    );
  }
}