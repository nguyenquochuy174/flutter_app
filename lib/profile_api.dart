import 'package:flutter/material.dart';
import 'package:flutter_nhom4/fetch_api_token.dart';

class ProfileApi extends StatefulWidget {
  final String accessToken;

  const ProfileApi({
    super.key,
    required this.accessToken,
  });

  @override
  State<ProfileApi> createState() => _ProfileApiState();
}

class _ProfileApiState extends State<ProfileApi> {
  final api = ApiService();
  Map<String, dynamic>? profileData;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  void loadProfile() async {
    profileData = await api.getProfile(widget.accessToken);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: profileData == null
          ? const Center(child: CircularProgressIndicator())
          : buildProfileScreen(),
    );
  }

  Widget buildProfileScreen() {
    return Column(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(profileData!["image"]),
        ),

        const SizedBox(height: 10),
        Text(
          "${profileData!["firstName"]} ${profileData!["lastName"]}",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),
        Text(
          "@${profileData!["username"]}",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),

        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              buildInfoItem(Icons.email, "Email", profileData!["email"]),
              buildInfoItem(Icons.person, "Gender", profileData!["gender"]),
              buildInfoItem(Icons.badge, "ID", profileData!["id"].toString()),
              buildInfoItem(Icons.account_circle, "Role", "User"),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildInfoItem(IconData icon, String title, String value) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
