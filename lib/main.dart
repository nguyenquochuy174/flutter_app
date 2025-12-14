import 'package:flutter/material.dart';
// import 'package:flutter_nhom4/change_color_app.dart';
import 'package:flutter_nhom4/home.dart';
// import 'package:flutter_nhom4/list_user.dart';
// import 'package:flutter_nhom4/login.dart';
// import 'package:flutter_nhom4/login_api.dart';
// import 'package:flutter_nhom4/detail_product.dart';
// import 'package:flutter_nhom4/my_product.dart';
// import 'package:flutter_nhom4/caculator_bmi.dart';
// import 'package:flutter_nhom4/feedback_form.dart';
// import 'package:flutter_nhom4/my_product.dart';
// import 'package:flutter_nhom4/count_number.dart';
// import 'package:flutter_nhom4/count_time.dart';
// import 'package:flutter_nhom4/login.dart';
// import 'package:flutter_nhom4/register.dart';
// import 'package:flutter_nhom4/change_color_app.dart';
// import 'package:flutter_nhom4/count_time.dart';
// import 'package:flutter_nhom4/list_place.dart';
// import 'package:flutter_nhom4/my_classroom_img.dart';
// import 'package:flutter_nhom4/my_home_page.dart';
// import 'package:flutter_nhom4/my_place.dart';
// import 'package:flutter_nhom4/my_classroom.dart';

void main() {
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
