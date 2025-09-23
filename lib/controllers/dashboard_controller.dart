import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/pages/home_page.dart';
import 'package:todolistapp_27_26/pages/history_page.dart';
import 'package:todolistapp_27_26/pages/profile_page.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
