import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/todolist.jpeg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Zayyan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Absen 26", style: TextStyle(color: Colors.grey)),
                    Text("Role 2", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/todolist.jpeg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Osmar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Absen 27", style: TextStyle(color: Colors.grey)),
                    Text("Role 1", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton.icon(
                onPressed: () {
                  authController.logout();
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
