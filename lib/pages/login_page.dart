import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/widgets/widget_button.dart';
import 'package:todolistapp_27_26/widgets/widget_textfield.dart';
import 'package:todolistapp_27_26/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: SingleChildScrollView( 
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to todolist-app",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text("Please login using your username and password"),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/todolist.jpeg',
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                textEditingController: authController.controllerUsername,
                labelText: "Username",
              ),
              const SizedBox(height: 16),
              MyTextField(
                textEditingController: authController.controllerPassword,
                labelText: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: "Login",
                onPressed: authController.login,
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
