import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/widgets/widget_button.dart';
import 'package:todolistapp_27_26/widgets/widget_textfield.dart';
import 'package:todolistapp_27_26/routes/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  String statusLogin = "login status";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Image
            Center(
              child: Image.asset('assets/todo.png', width: 100, height: 100),

            const Text(
              "Welcome to todolist-app",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Please login using your username and password"),
            const SizedBox(height: 15),

            Center(
              child: Image.asset(
                'assets/todolist.jpeg',
                width: 100,
                height: 100,
              ),

            ),

            const SizedBox(height: 20),

            MyTextField(
              textEditingController: controllerUsername,
              labelText: "Username",
            ),

            const SizedBox(height: 10),

            MyTextField(
              textEditingController: controllerPassword,
              labelText: "Password",
              isPassword: true,
            ),

            const SizedBox(height: 25),

            Center(
              child: CustomButton(
                text: "Login",

                onPressed: () {
                  if (controllerUsername.text == "admin" &&
                      controllerPassword.text == "admin123") {
                    Get.offAllNamed(AppRoutes.dashboard);
                  } else {
                    Get.snackbar(
                      "Login Failed",
                      "Username / Password salah",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.withValues(alpha: 2.2),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
