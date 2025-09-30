import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onPressed;
  final Color backgroundColor; 
  final Color foregroundColor; 

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.red, 
    this.foregroundColor = Colors.white, 
  });


  factory CustomButton.icon({
    required VoidCallback onPressed,
    required Widget icon,
    required Widget label,
    Color backgroundColor = Colors.red,
    Color foregroundColor = Colors.white,
  }) {
    return CustomButton(
      onPressed: onPressed,
      icon: icon,
      text: (label is Text) ? label.data ?? "" : "",
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
