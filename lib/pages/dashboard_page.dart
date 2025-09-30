import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/dashboard_controller.dart';
class DashboardPage extends StatelessWidget {
  final DashboardController dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
         body: dashboardController.pages[dashboardController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: dashboardController.currentIndex.value,
            onTap: (index) => dashboardController.changePage(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ));
  }
}
