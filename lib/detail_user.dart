import 'package:flutter/material.dart';
import 'package:flutter_nhom4/model/user.dart';
class DetailUser extends StatelessWidget {
  final User user;

  const DetailUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết người dùng",
            style: TextStyle(fontSize: 22, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),

            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Text(
                user.name.firstname[0].toUpperCase(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 15),

            Text(
              user.name.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 25),

            buildInfoTile(Icons.email, "Email", user.email),
            buildInfoTile(Icons.person, "Username", user.username),
            buildInfoTile(Icons.phone, "Số điện thoại", user.phone),

            SizedBox(height: 10),
            Divider(),

            SizedBox(height: 10),
            Text("Địa chỉ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            SizedBox(height: 5),

            buildInfoTile(Icons.location_city, "Thành phố", user.address.city),
            buildInfoTile(Icons.home, "Đường", user.address.street),
            buildInfoTile(Icons.numbers, "Số nhà", user.address.number.toString()),
            buildInfoTile(Icons.local_post_office, "Zipcode", user.address.zipcode),

            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title: $value",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}