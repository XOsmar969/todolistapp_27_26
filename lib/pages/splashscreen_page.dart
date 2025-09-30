import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/splashscreen_controller.dart';

class SplashScreenPage extends StatelessWidget {
 SplashScreenPage({super.key});
final splashController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text("Ini Splash Screen"))),
    );
  }
}
