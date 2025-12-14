import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(
              "Hello", 
              style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ),
            Icon(Icons.heart_broken, color: Colors.red, size: 100,),
            Text(
              "Goodbye", 
              style: TextStyle(color: Colors.blue, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}