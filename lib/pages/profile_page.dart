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
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isWide ? size.width * 0.1 : 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: size.height * 0.05),
              Flexible(
                child: SingleChildScrollView(
                  child: isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            ProfileCard(
                              name: "Zayyan.",
                              absen: "Absen 26",
                              role: "Role 2",
                              imagePath: "assets/todolist.jpeg",
                            ),
                            ProfileCard(
                              name: "Osmar",
                              absen: "Absen 27",
                              role: "Role 1",
                              imagePath: "assets/todolist.jpeg",
                            ),
                          ],
                        )
                      : Column(
                          children: const [
                            ProfileCard(
                              name: "Zayyan.",
                              absen: "Absen 26",
                              role: "Role 2",
                              imagePath: "assets/todolist.jpeg",
                            ),
                            SizedBox(height: 20),
                            ProfileCard(
                              name: "Osmar",
                              absen: "Absen 27",
                              role: "Role 1",
                              imagePath: "assets/todolist.jpeg",
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              CustomButton.icon(
                onPressed: () => authController.logout(),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                backgroundColor: Colors.red,
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
