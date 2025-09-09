import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:todolistapp_27_26/controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Gambar 1
            ClipOval(
              child: Image.asset(
                "assets/Zayyan.jpg", // pastikan file ada di assets
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
  
            // Nama untuk gambar 1
            const Text(
              "Muhammad Zayyan Fahrezi(26)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),

            // Gambar 2
// Gambar 2
ClipOval(
  child: Image.asset(
    "assets/isagi.jpg", // pastikan file ada di assets
    width: 100,
    height: 100,
    fit: BoxFit.cover,
  ),
),
const SizedBox(height: 20),

            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/isagi.jpg'),
            ),
            const SizedBox(height: 10),
            const Text(
              "App Todo-list",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text("todo@gmail.com", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blueAccent),
                title: const Text("Nomor Telepon"),
                subtitle: const Text("+62** **** ****"),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                ),
                title: const Text("Alamat"),
                subtitle: const Text("SMK RUS"),

              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.blueAccent),
                title: const Text("About"),
                subtitle: const Text("Aktivitas"),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Logout
            ElevatedButton.icon(
              onPressed: () {
                // Aksi ketika logout ditekan
                // Contoh: kembali ke halaman login
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
  
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
