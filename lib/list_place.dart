import 'dart:math';

import 'package:flutter/material.dart';

class ListPlace extends StatelessWidget {
  const ListPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Danh sách địa điểm",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Charlie',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                search(),
                SizedBox(height: 80),
                Text(
                  "Saved Places",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                listPlace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            print("Ok rồi đấy 1!!!!");
          },
          icon: Icon(Icons.notifications, color: Colors.black),
        ),
        IconButton(
          onPressed: () {
            print("Ok rồi đấy 2!!!!");
          },
          icon: Icon(Icons.extension, color: Colors.black),
        ),
      ],
    );
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.blue),
          hintText: 'Search',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }

  Widget placeItem(String imgPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }

  Widget listPlace() {
    final Random random = Random();
    final images = [
      "assets/images/place1.jpg",
      "assets/images/place2.jpg",
      "assets/images/place3.jpg",
      "assets/images/place4.jpg",
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: List.generate(15, (index) {
        return placeItem(images[random.nextInt(images.length)]);
      }),
    );
  }
}
