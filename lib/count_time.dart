import 'dart:async';
import 'package:flutter/material.dart';

class CountTime extends StatefulWidget {
  const CountTime({super.key});

  @override
  State<CountTime> createState() => _CountTimeState();
}

class _CountTimeState extends State<CountTime> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 0;

  void _start() {
    if (_timer != null && _timer!.isActive) return; 

    final input = int.tryParse(_controller.text);
    if (input == null || input <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nhập số giây')),
      );
      return;
    }

    setState(() {
      _remainingSeconds = input;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hết thời gian!')),
        );
      }
    });
  }

  void _refresh() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = 0;
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    String seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_top, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Bộ đếm thời gian",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nhập số giây đếm ngược:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nhập số giây',
                ),
              ),
              SizedBox(height: 30),
              Text(
                "$minutes:$seconds",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: _start,
                    icon: Icon(Icons.play_arrow),
                    label: Text("Bắt đầu"),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 67, 67, 67),
                    ),
                    onPressed: _refresh,
                    icon: Icon(Icons.refresh, color: Colors.white),
                    label: Text(
                      "Đặt lại",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
