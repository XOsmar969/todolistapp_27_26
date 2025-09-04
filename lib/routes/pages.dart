import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/routes/routes.dart';
import 'package:todolistapp_27_26/login_page.dart';
import 'package:todolistapp_27_26/pages/dashboard_page.dart';
import 'package:todolistapp_27_26/pages/add_todo_page.dart';
import 'package:todolistapp_27_26/bindings/auth_binding.dart';
import 'package:todolistapp_27_26/bindings/home_binding.dart';

class AppPages {
  static final pages = [
    // Login Page
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),

    // Dashboard (BottomNav: Home, History, Profile)
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: HomeBinding(),
    ),

    // Add Todo
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: HomeBinding(),
    ),
  ];
}
