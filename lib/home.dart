import 'package:flutter/material.dart';
import 'package:flutter_nhom4/caculator_bmi.dart';
import 'package:flutter_nhom4/change_color_app.dart';
import 'package:flutter_nhom4/count_number.dart';
import 'package:flutter_nhom4/count_time.dart';
import 'package:flutter_nhom4/feedback_form.dart';
import 'package:flutter_nhom4/list_new.dart';
import 'package:flutter_nhom4/list_place.dart';
import 'package:flutter_nhom4/list_user.dart';
import 'package:flutter_nhom4/login.dart';
import 'package:flutter_nhom4/login_api.dart';
import 'package:flutter_nhom4/my_classroom.dart';
import 'package:flutter_nhom4/my_classroom_img.dart';
import 'package:flutter_nhom4/my_place.dart';
import 'package:flutter_nhom4/my_product.dart';
import 'package:flutter_nhom4/register.dart';
import 'falling_leaves.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> exercises = [
    {
      "title": "BMI Calculator",
      "page": const CaculatorBmi(),
      "icon": Icons.monitor_weight,
    },
    {
      "title": "Change Color App",
      "page": const MyChangeColorApp(),
      "icon": Icons.color_lens,
    },
    {
      "title": "Count Number",
      "page": const CountNumber(),
      "icon": Icons.exposure_plus_1,
    },
    {"title": "Count Time", "page": const CountTime(), "icon": Icons.timer},
    {
      "title": "Feedback Form",
      "page": const FeedbackForm(),
      "icon": Icons.feedback,
    },
    {"title": "List Place", "page": const ListPlace(), "icon": Icons.place},
    {"title": "List User", "page": const ListUser(), "icon": Icons.people},
    {"title": "List News", "page": const ListNews(), "icon": Icons.article},
    {
      "title": "My Classroom",
      "page": const MyClassroom(),
      "icon": Icons.class_,
    },
    {
      "title": "My Classroom Image",
      "page": const MyClassroomImg(),
      "icon": Icons.image,
    },
    {"title": "My Place", "page": const MyPlace(), "icon": Icons.map},
    {
      "title": "My Product",
      "page": const MyProduct(),
      "icon": Icons.shopping_cart,
    },
    {"title": "Login", "page": const Login(), "icon": Icons.login},
    {"title": "Login API", "page": const LoginApi(), "icon": Icons.api},
    {
      "title": "Register",
      "page": const Register(),
      "icon": Icons.app_registration,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              "Danh sách bài tập",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Nguyễn Quốc Huy",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Mã sinh viên: 22T1080012",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Lập trình di động - Nhóm 4",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.list, color: Colors.blue, size: 28),
                  title: const Text(
                    "Danh sách bài tập",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ...exercises.asMap().entries.map((entry) {
                  int index = entry.key;
                  var item = entry.value;

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      radius: 22,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Icon(item["icon"], color: Colors.blue, size: 20),
                        const SizedBox(width: 8),
                        Text(item["title"]),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => item["page"] as Widget,
                        ),
                      );
                    },
                  );
                }).toList(),
              ],
            ),
          ),
          body: const Center(
            child: Text(
              "Chọn bài tập trong Menu",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),

        const FallingLeaves(),
      ],
    );
  }
}
