import 'package:get/get.dart';
import 'package:todolistapp_27_26/bindings/todo_binding.dart';
import 'package:todolistapp_27_26/pages/add_todo_page.dart';
import 'package:todolistapp_27_26/pages/home_page.dart';
import 'package:todolistapp_27_26/routes/routes.dart';
import 'package:todolistapp_27_26/pages/login_page.dart';
import 'package:todolistapp_27_26/pages/dashboard_page.dart';
import 'package:todolistapp_27_26/bindings/auth_binding.dart';
import 'package:todolistapp_27_26/pages/splashscreen_page.dart';
import 'package:todolistapp_27_26/bindings/splashscreen_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.addTodo, page: () => AddTodoPage()),
  ];
}
