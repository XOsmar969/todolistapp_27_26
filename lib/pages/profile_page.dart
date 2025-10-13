import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/auth_controller.dart';
import 'package:todolistapp_27_26/widgets/widget_button.dart';
import 'package:todolistapp_27_26/widgets/profile_card.dart';

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
              children: const [
                ProfileCard(
                  name: "Zayyan.",
                  absen: "Absen 26",
                  role: "Role 2",
                  imagePath: "assets/todolist.jpeg",
                ),
                SizedBox(width: 60),
                ProfileCard(
                  name: "Osmar",
                  absen: "Absen 27",
                  role: "Role 1",
                  imagePath: "assets/todolist.jpeg",
                ),
              ],
            ),
            CustomButton.icon(
              onPressed: () => authController.logout(),
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
