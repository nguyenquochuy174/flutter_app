import 'package:flutter/material.dart';

class CountNumber extends StatefulWidget {
  const CountNumber({super.key});

  @override
  State<CountNumber> createState() => _CountNumberState();
}

class _CountNumberState extends State<CountNumber> {
  int _counter = 0;
  _decrement() {
    setState(() {
      _counter--;
    });
  }
  _increment() {
    setState(() {
      _counter++;
    });
  }
  _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.countertops_sharp, color: Colors.white), 
            SizedBox(width: 8), 
            Text("Ứng dụng đếm số", style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: Center(
        child: myBody(),
      ),
    );
  }
  Widget myBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Giá trị hiện tại:", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(_counter.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {  _decrement(); },
                icon: Icon(Icons.remove, color: Colors.white,),
                label: Text("Giảm",  style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: () { _reset(); },
                icon: Icon(Icons.refresh, color: Colors.white,), 
                label: Text("Đặt lại", style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: ()  { _increment(); },
                icon: Icon(Icons.add, color: Colors.white,), 
                label: Text("Tăng",  style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ],
      ),
    );
  }
}