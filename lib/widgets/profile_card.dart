import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String absen;
  final String role;
  final String imagePath;

  const ProfileCard({
    super.key,
    required this.name,
    required this.absen,
    required this.role,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(absen, style: const TextStyle(color: Colors.grey)),
        Text(role, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
