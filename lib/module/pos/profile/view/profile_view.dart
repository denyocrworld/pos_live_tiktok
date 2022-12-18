import 'package:flutter/material.dart';
import 'package:example/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: Get.width / 6,
                backgroundImage: const NetworkImage(
                  "https://i.ibb.co/PGv8ZzG/me.jpg",
                ),
              ),
              const Text(
                "Deny Ocr",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "denyocr.world@gmail.com",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                "Front End Developer",
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Card(
                child: ListTile(
                  title: Text("Settings"),
                  subtitle: Text("Your app settings"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text("TOS"),
                  subtitle: Text("Term of service"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text("Privacy policy"),
                  subtitle: Text("-"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
