import 'package:flutter/material.dart';
import 'package:flutter_nhom4/detail_user.dart';
import 'package:flutter_nhom4/model/user.dart';
import 'package:flutter_nhom4/get_api_user.dart';


class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {

  String searchText = "";
  late Future<List<User>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = test_api_user.getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách người dùng", style: TextStyle(fontSize: 24,color: Colors.white)),
        centerTitle: true,
        backgroundColor:  Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: FutureBuilder(
        future: futureUser,
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          List<User> allUsers = snap.data!;
          List<User> filtered =
              allUsers.where((p) => p.name.toString().toLowerCase().contains(searchText.toLowerCase())).toList();

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm người dùng...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),

              Expanded(child: myListView(filtered)),
            ],
          );
        },
      ),
    );
  }

  Widget myListView(List<User> ls) {
    return ListView(
      children: ls.map((e) => myItem(e)).toList(),
    );
  }

  Widget myItem(User p) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailUser(user: p),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blue,
                child: Text(
                  p.name.firstname[0].toUpperCase(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(width: 15),

              // Thông tin
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.name.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      p.email,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),

                    SizedBox(height: 5),

                    Row(
                      children: [
                      Icon(Icons.phone, size: 16, color: Colors.green),
                        SizedBox(width: 5),
                        Text(p.phone),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
